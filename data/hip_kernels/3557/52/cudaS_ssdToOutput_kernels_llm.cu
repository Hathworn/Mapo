#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaS_ssdToOutput_kernels(
    unsigned int batchSize, unsigned int nbClass, unsigned int nbAnchors, unsigned int channelWidth, unsigned int channelHeight, unsigned int nbProposals, unsigned int* nbValidROIs, unsigned int cls, unsigned int totalParts, unsigned int totalTemplates, unsigned int maxParts, unsigned int maxTemplates, unsigned int cumulParts, unsigned int cumulTemplates, unsigned int nbParts, unsigned int nbTemplates, float xRatio, float yRatio, float xOutputRatio, float yOutputRatio, const float* roi_bbox, const float* roi_anchors, const float* anchors, const float* inputs_parts, const float* inputs_templates, float* outputs)
{
    const int batchPos = blockIdx.z;
    const int proposal = (threadIdx.x & 0x1f) + blockIdx.x*blockDim.x;
    const int ptIdx = blockIdx.y;
    const unsigned int nbAnchorPerCls = nbAnchors;
    const int nbDetectedObject  = (int) nbValidROIs[batchPos];
    const int nbIdx = 6;

    if(proposal < nbProposals)
    {
        const unsigned int n = proposal + cls*nbProposals + batchPos*nbProposals*nbClass;

        if(proposal < nbDetectedObject)
        {
            // Efficient initialization of the output
            float* outBasePtr = &outputs[n*(nbIdx + maxParts*2 + maxTemplates*3)];
            const float* roiBasePtr = &roi_bbox[5*proposal + batchPos*nbProposals*5];

            if(ptIdx == 0)
            {
                outBasePtr[0] = roiBasePtr[0];
                outBasePtr[1] = roiBasePtr[1];
                outBasePtr[2] = roiBasePtr[2];
                outBasePtr[3] = roiBasePtr[3];
                outBasePtr[4] = roiBasePtr[4];
                outBasePtr[5] = (float) cls;
            }

            if(ptIdx < nbParts && totalParts > 0)
            {
                const unsigned int xa = roiBasePtr[0];
                const unsigned int ya = roiBasePtr[1];
                const unsigned int k  = roiBasePtr[2];

                const int yIdx = xa + ya * channelWidth + (k * nbParts * 2 + cumulParts + ptIdx * 2) * channelHeight * channelWidth + batchPos * channelHeight * channelWidth * nbAnchorPerCls * 2 * totalParts;
                const int xIdx = xa + ya * channelWidth + (k * nbParts * 2 + cumulParts + ptIdx * 2 + 1) * channelHeight * channelWidth + batchPos * channelHeight * channelWidth * nbAnchorPerCls * 2 * totalParts;

                const float partY = inputs_parts[yIdx];
                const float partX = inputs_parts[xIdx];

                const int xa0 = (int)(anchors[cls * 4 * nbAnchorPerCls + k * 4] + xa * xRatio);
                const int ya0 = (int)(anchors[cls * 4 * nbAnchorPerCls + k * 4 + 1] + ya * yRatio);
                const int xa1 = (int)(anchors[cls * 4 * nbAnchorPerCls + k * 4 + 2] + xa * xRatio);
                const int ya1 = (int)(anchors[cls * 4 * nbAnchorPerCls + k * 4 + 3] + ya * yRatio);

                const int wa = xa1 - xa0;
                const int ha = ya1 - ya0;

                const float xac = xa0 + wa / 2.0;
                const float yac = ya0 + ha / 2.0;

                outBasePtr[ptIdx * 2 + 0 + nbIdx] = ((partY) * ha + yac) * yOutputRatio;
                outBasePtr[ptIdx * 2 + 1 + nbIdx] = ((partX) * wa + xac) * xOutputRatio;
            }
            else if(ptIdx < maxParts && totalParts > 0)
            {
                outBasePtr[ptIdx * 2 + 0 + nbIdx] = 0.0;
                outBasePtr[ptIdx * 2 + 1 + nbIdx] = 0.0;
            }

            if(ptIdx < nbTemplates && totalTemplates > 0)
            {
                const unsigned int xa = roiBasePtr[0];
                const unsigned int ya = roiBasePtr[1];
                const unsigned int k  = roiBasePtr[2];

                const int yIdx = xa + ya * channelWidth + (k * nbTemplates * 3 + cumulTemplates + ptIdx * 3) * channelHeight * channelWidth + batchPos * channelHeight * channelWidth * nbAnchorPerCls * 3 * totalTemplates;
                const int xIdx = xa + ya * channelWidth + (k * nbTemplates * 3 + cumulTemplates + ptIdx * 3 + 1) * channelHeight * channelWidth + batchPos * channelHeight * channelWidth * nbAnchorPerCls * 3 * totalTemplates;
                const int zIdx = xa + ya * channelWidth + (k * nbTemplates * 3 + cumulTemplates + ptIdx * 3 + 2) * channelHeight * channelWidth + batchPos * channelHeight * channelWidth * nbAnchorPerCls * 3 * totalTemplates;

                outBasePtr[ptIdx * 3 + maxParts * 2 + 0 + nbIdx] = expf(inputs_templates[yIdx]);
                outBasePtr[ptIdx * 3 + maxParts * 2 + 1 + nbIdx] = expf(inputs_templates[xIdx]);
                outBasePtr[ptIdx * 3 + maxParts * 2 + 2 + nbIdx] = expf(inputs_templates[zIdx]);
            }
            else if(ptIdx < maxTemplates && totalTemplates > 0)
            {
                outBasePtr[ptIdx * 3 + maxParts * 2 + 0 + nbIdx] = 0.0;
                outBasePtr[ptIdx * 3 + maxParts * 2 + 1 + nbIdx] = 0.0;
                outBasePtr[ptIdx * 3 + maxParts * 2 + 2 + nbIdx] = 0.0;
            }

        }
        else
        {
            float* outBasePtr = &outputs[n*(nbIdx + maxParts*2 + maxTemplates*3)];
            outBasePtr[0] = 0.0;
            outBasePtr[1] = 0.0;
            outBasePtr[2] = 0.0;
            outBasePtr[3] = 0.0;
            outBasePtr[4] = 0.0;

            if(ptIdx < maxParts && totalParts > 0)
            {
                outBasePtr[ptIdx * 2 + 0 + nbIdx] = 0.0;
                outBasePtr[ptIdx * 2 + 1 + nbIdx] = 0.0;
            }

            if(ptIdx < maxTemplates && totalTemplates > 0)
            {
                outBasePtr[ptIdx * 3 + maxParts * 2 + 0 + nbIdx] = 0.0;
                outBasePtr[ptIdx * 3 + maxParts * 2 + 1 + nbIdx] = 0.0;
                outBasePtr[ptIdx * 3 + maxParts * 2 + 2 + nbIdx] = 0.0;
            }
        }
    }
}