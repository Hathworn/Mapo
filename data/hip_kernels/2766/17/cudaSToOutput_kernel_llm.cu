#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cudaSToOutput_kernel(const unsigned int nbProposals, const unsigned int scoreIdx, const unsigned int nbCls, const unsigned int nbOutputs, const unsigned int maxParts, const unsigned int maxTemplates, bool generateParts, bool generateTemplates, const int* numPartsPerClass, const int* numTemplatesPerClass, const int* maxCls, const float* ROIEst, const int* predictionIndex, const float* partsPrediction, const float* partsVisibilityPrediction, const float* templatesPrediction, float* outputs)
{
    const int batchPos = blockIdx.z * nbProposals;
    const int index = (threadIdx.x & 0x1f) + blockIdx.x * blockDim.x;

    if (index < nbProposals)
    {
        const unsigned int inputIdx = index * 4 * (nbCls - scoreIdx) + batchPos * 4 * (nbCls - scoreIdx);
        unsigned int outputIdx = 0;
        unsigned offset = 0;

        if ((nbOutputs == 4))
            outputIdx = index * 4 + batchPos * 4;
        else if ((nbOutputs == 5))
            outputIdx = index * 5 + batchPos * 5;
        else if (generateParts && generateTemplates)
            outputIdx = (index + batchPos) * (5 + maxParts * 3 + maxTemplates * 3);
        else if (generateTemplates)
            outputIdx = (index + batchPos) * (5 + maxTemplates * 3);
        else if (generateParts)
            outputIdx = (index + batchPos) * (5 + maxParts * 3);

        // Copy ROI estimates directly
        for (unsigned int i = 0; i < 4; ++i)
            outputs[i + outputIdx] = ROIEst[i + inputIdx];

        offset = 4;

        if (nbOutputs > 4)
        {
            int cls = maxCls[index + batchPos];
            outputs[offset + outputIdx] = cls > -1 ? (float)cls : 0.0f;
            offset += 1;
        }

        if (generateParts)
        {
            const int predProp = predictionIndex[(index + batchPos) * 2];
            const int predCls = predictionIndex[(index + batchPos) * 2 + 1];

            if (predCls > -1)
            {
                // PARTS PROCESSING
                for (unsigned int part = 0; part < numPartsPerClass[predCls]; ++part)
                {
                    const unsigned int partIdx = batchPos * maxParts * 2 * nbCls
                        + predProp * maxParts * 2 * nbCls
                        + predCls * maxParts * 2 + part * 2;

                    outputs[offset + part * 2 + outputIdx] = partsPrediction[partIdx];
                    outputs[offset + part * 2 + outputIdx + 1] = partsPrediction[partIdx + 1];
                }

                for (unsigned int idx = numPartsPerClass[predCls]; idx < maxParts; ++idx)
                {
                    outputs[offset + numPartsPerClass[predCls] * 2 + idx * 2 + outputIdx] = 0.0f;
                    outputs[offset + numPartsPerClass[predCls] * 2 + idx * 2 + outputIdx + 1] = 0.0f;
                }
            }

            offset += 2 * maxParts;

            if (predCls > -1)
            {
                // PARTS VISIBILITY PROCESSING
                for (unsigned int part = 0; part < numPartsPerClass[predCls]; ++part)
                {
                    const unsigned int partVisibilityIdx = batchPos * maxParts * nbCls
                        + predProp * maxParts * nbCls + predCls * maxParts + part;

                    outputs[offset + part + outputIdx] = partsVisibilityPrediction[partVisibilityIdx];
                }

                for (unsigned int idx = numPartsPerClass[predCls]; idx < maxParts; ++idx)
                    outputs[offset + numPartsPerClass[predCls] + idx + outputIdx] = -1.0f;
            }
            offset += maxParts;
        }

        if (generateTemplates)
        {
            const int predProp = predictionIndex[(index + batchPos) * 2];
            const int predCls = predictionIndex[(index + batchPos) * 2 + 1];

            if (predCls > -1)
            {
                for (unsigned int tpl = 0; tpl < numTemplatesPerClass[predCls]; ++tpl)
                {
                    const unsigned int templateIdx = batchPos * maxTemplates * 3 * nbCls
                        + predProp * maxTemplates * 3 * nbCls
                        + predCls * maxTemplates * 3 + tpl * 3;

                    for (int i = 0; i < 3; ++i)
                        outputs[offset + tpl * 3 + outputIdx + i] = templatesPrediction[templateIdx + i];
                }

                for (unsigned int idx = numTemplatesPerClass[predCls]; idx < maxTemplates; ++idx)
                {
                    outputs[offset + numTemplatesPerClass[predCls] * 3 + idx * 3 + outputIdx] = 0.0f;
                    outputs[offset + numTemplatesPerClass[predCls] * 3 + idx * 3 + outputIdx + 1] = 0.0f;
                    outputs[offset + numTemplatesPerClass[predCls] * 3 + idx * 3 + outputIdx + 2] = 0.0f;
                }
            }
        }
    }
}