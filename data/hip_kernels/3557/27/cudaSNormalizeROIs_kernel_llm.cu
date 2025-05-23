#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaSNormalizeROIs_kernel( unsigned int inputSizeX, unsigned int inputSizeY, unsigned int nbProposals, unsigned int batchSize, unsigned int scoreIdx, unsigned int nbCls, unsigned int maxParts, unsigned int maxTemplates, bool keepMax, bool generateParts, bool generateTemplates, const float normX, const float normY, const float* means, const float* std, const int* numPartsPerClass, const int* numTemplatesPerClass, const float* ROIRef, const float* ROIEst, const float* ValueEst, const float* partsEst, const float* partsVisibilityEst, const float* templatesEst, float* outputs, int* argMax, float* partsPrediction, float* partsVisibilityPrediction, float* templatesPrediction, float scoreThreshold)
{
    const int batchPos = blockIdx.z * nbProposals;
    const int index = (threadIdx.x & 0x1f) + blockIdx.x * blockDim.x;

    if (index < nbProposals)
    {
        unsigned int indexMin = scoreIdx;
        unsigned int indexMax = nbCls;

        if (keepMax)
        {
            unsigned int cls = scoreIdx;
            float maxVal = 0.0;

            #pragma unroll 4  // Loop unrolling for better performance
            for (unsigned int i = indexMin; i < indexMax; ++i)
            {
                unsigned int inputIdx = i + index * nbCls + batchPos * nbCls;

                if (ValueEst[inputIdx] >= maxVal)
                {
                    maxVal = ValueEst[inputIdx];
                    cls = i;
                }
            }
            argMax[index + batchPos] = cls;

            indexMin = cls;
            indexMax = cls + 1;
        }
        else
            argMax[index + batchPos] = -1;

        #pragma unroll 2  // Loop unrolling for optimization
        for (unsigned int clsIdx = indexMin; clsIdx < indexMax; ++clsIdx)
        {
            unsigned int bboxRefIdx = index * 4 + batchPos * 4;
            unsigned int bboxEstIdx = clsIdx * 4 + index * 4 * nbCls + batchPos * 4 * nbCls;
            unsigned int valEstIdx = clsIdx + index * nbCls + batchPos * nbCls;
            unsigned int outputIdx = keepMax ? 
                index * 4 * (nbCls - scoreIdx) + batchPos * 4 * (nbCls - scoreIdx)
                : (clsIdx - scoreIdx) * 4 + index * 4 * (nbCls - scoreIdx) + batchPos * 4 * (nbCls - scoreIdx);

            const float xbbRef = ROIRef[0 + bboxRefIdx] * normX;
            const float ybbRef = ROIRef[1 + bboxRefIdx] * normY;
            const float wbbRef = ROIRef[2 + bboxRefIdx] * normX;
            const float hbbRef = ROIRef[3 + bboxRefIdx] * normY;

            const float xbbEst = ROIEst[0 + bboxEstIdx] * std[0] + means[0];
            const float ybbEst = ROIEst[1 + bboxEstIdx] * std[1] + means[1];
            const float wbbEst = ROIEst[2 + bboxEstIdx] * std[2] + means[2];
            const float hbbEst = ROIEst[3 + bboxEstIdx] * std[3] + means[3];

            float x = xbbEst * wbbRef + xbbRef + wbbRef / 2.0 - (wbbRef / 2.0) * expf(wbbEst);
            float y = ybbEst * hbbRef + ybbRef + hbbRef / 2.0 - (hbbRef / 2.0) * expf(hbbEst);
            float w = wbbRef * expf(wbbEst);
            float h = hbbRef * expf(hbbEst);

            /** Clamp values **/
            if (x < 0.0)
            {
                w += x;
                x = 0.0;
            }

            if (y < 0.0)
            {
                h += y;
                y = 0.0;
            }

            w = ((w + x) > 1.0) ? (1.0 - x) / normX : w / normX;
            h = ((h + y) > 1.0) ? (1.0 - y) / normY : h / normY;

            x /= normX;
            y /= normY;

            if (ValueEst[valEstIdx] >= scoreThreshold)
            {
                outputs[0 + outputIdx] = x;
                outputs[1 + outputIdx] = y;
                outputs[2 + outputIdx] = w;
                outputs[3 + outputIdx] = h;
                
                if (generateParts)
                {
                    unsigned int partsIdx = 0;
                    unsigned int proposalPartIdx = 0;
                    for (int idxCls = 0; idxCls < clsIdx; ++idxCls)
                        partsIdx += numPartsPerClass[idxCls];

                    proposalPartIdx = partsIdx;

                    for (int idxCls = clsIdx; idxCls < nbCls; ++idxCls)
                        proposalPartIdx += numPartsPerClass[idxCls];

                    #pragma unroll  // Loop unrolling for performance
                    for (unsigned int part = 0; part < numPartsPerClass[clsIdx]; ++part)
                    {
                        /// PARTS PROCESSING
                        const unsigned int inPartIdx = batchPos * 2 * proposalPartIdx
                            + index * 2 * proposalPartIdx
                            + partsIdx * 2
                            + part * 2;

                        const unsigned int outPartIdx = batchPos * 2 * maxParts * nbCls
                            + index * 2 * maxParts * nbCls
                            + clsIdx * 2 * maxParts
                            + part * 2;

                        const float partY = partsEst[0 + inPartIdx];
                        const float partX = partsEst[1 + inPartIdx];
                        partsPrediction[0 + outPartIdx] = ((partY + 0.5f) * hbbRef + ybbRef) / normY;
                        partsPrediction[1 + outPartIdx] = ((partX + 0.5f) * wbbRef + xbbRef) / normX;

                        /// PARTS VISIBILITY PROCESSING
                        const unsigned int inPartVisibilityIdx = batchPos * 4 * proposalPartIdx
                            + index * 4 * proposalPartIdx
                            + partsIdx * 4
                            + part * 4;

                        const unsigned int outPartVisibilityIdx = batchPos * maxParts * nbCls
                            + index * maxParts * nbCls
                            + clsIdx * maxParts
                            + part;

                        float idxMax = 0.0;
                        float valueMax = partsVisibilityEst[inPartVisibilityIdx];

                        #pragma unroll  // Loop unrolling for optimization
                        for (unsigned int v = 1; v < 4; ++v)
                        {
                            if (partsVisibilityEst[v + inPartVisibilityIdx] > valueMax)
                            {
                                idxMax = static_cast<float>(v);
                                valueMax = partsVisibilityEst[v + inPartVisibilityIdx];
                            }
                        }
                        partsVisibilityPrediction[outPartVisibilityIdx] = idxMax;
                    }
                }
                if (generateTemplates)
                {
                    unsigned int templatesIdx = 0;
                    unsigned int proposalTemplateIdx = 0;
                    for (int idxCls = 0; idxCls < clsIdx; ++idxCls)
                        templatesIdx += numTemplatesPerClass[idxCls];

                    proposalTemplateIdx = templatesIdx;

                    for (int idxCls = clsIdx; idxCls < nbCls; ++idxCls)
                        proposalTemplateIdx += numTemplatesPerClass[idxCls];

                    #pragma unroll  // Optimize loop
                    for (unsigned int tpl = 0; tpl < numTemplatesPerClass[clsIdx]; ++tpl)
                    {
                        const unsigned int inTemplateIdx = batchPos * 3 * proposalTemplateIdx
                            + index * 3 * proposalTemplateIdx
                            + templatesIdx * 3
                            + tpl * 3;

                        const unsigned int outTemplateIdx = batchPos * 3 * maxTemplates * nbCls
                            + index * 3 * maxTemplates * nbCls
                            + clsIdx * 3 * maxTemplates
                            + tpl * 3;

                        const float templateA = expf(templatesEst[0 + inTemplateIdx]);
                        const float templateB = expf(templatesEst[1 + inTemplateIdx]);
                        const float templateC = expf(templatesEst[2 + inTemplateIdx]);

                        templatesPrediction[0 + outTemplateIdx] = templateA;
                        templatesPrediction[1 + outTemplateIdx] = templateB;
                        templatesPrediction[2 + outTemplateIdx] = templateC;
                    }
                }
            }
            else
            {
                outputs[0 + outputIdx] = 0.0;
                outputs[1 + outputIdx] = 0.0;
                outputs[2 + outputIdx] = 0.0;
                outputs[3 + outputIdx] = 0.0;
            }
        }
    }
}