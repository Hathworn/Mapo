#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cudaS_ssdToOutput_kernels(  unsigned int batchSize, unsigned int nbClass, unsigned int nbAnchors, unsigned int channelWidth, unsigned int channelHeight, unsigned int nbProposals, unsigned int* nbValidROIs, unsigned int cls, unsigned int totalParts, unsigned int totalTemplates, unsigned int maxParts, unsigned int maxTemplates, unsigned int cumulParts, unsigned int cumulTemplates, unsigned int nbParts, unsigned int nbTemplates, float xRatio, float yRatio, float xOutputRatio, float yOutputRatio, const float* roi_bbox, const float* roi_anchors, const float* anchors, const float* inputs_parts, const float* inputs_templates, float* outputs)
{
    const int batchPos = blockIdx.z;
    const int proposal = (threadIdx.x & 0x1f) + blockIdx.x*blockDim.x;
    const int ptIdx = blockIdx.y;

    // Precompute commonly used index
    const unsigned int n = proposal + cls*nbProposals + batchPos*nbProposals*nbClass;
    const int baseOutputIdx = n * (6 + maxParts*2 + maxTemplates*3);

    const int nbDetectedObject  = (int) nbValidROIs[batchPos];
    if (proposal < nbProposals) {
        if (proposal < nbDetectedObject) {
            if (ptIdx == 0) {
                // Reusing memory layout calculations
                const int baseRoiIdx = 5 * proposal + batchPos * nbProposals * 5;
                for (int i = 0; i < 5; ++i) {
                    outputs[i + baseOutputIdx] = roi_bbox[i + baseRoiIdx];
                }
                outputs[5 + baseOutputIdx] = (float) cls;
            }

            if (ptIdx < nbParts && totalParts > 0) {
                const unsigned int xa = roi_anchors[0 + 5*proposal + batchPos*nbProposals*5];
                const unsigned int ya = roi_anchors[1 + 5*proposal + batchPos*nbProposals*5];
                const unsigned int k  = roi_anchors[2 + 5*proposal + batchPos*nbProposals*5];

                // Use precomputed size multipliers
                const int partOffset = (k * nbParts * 2 + cumulParts + ptIdx * 2) * channelHeight * channelWidth;
                const int batchOffset = batchPos * channelHeight * channelWidth * nbAnchors * 2 * totalParts;
                
                const int yIdx = xa + ya * channelWidth + partOffset + batchOffset;
                const int xIdx = yIdx + channelHeight * channelWidth;

                const float partY = inputs_parts[yIdx];
                const float partX = inputs_parts[xIdx];

                const int xa0 = (int)(anchors[k * 4] + xa * xRatio);
                const int ya0 = (int)(anchors[k * 4 + 1] + ya * yRatio);
                const int xa1 = (int)(anchors[k * 4 + 2] + xa * xRatio);
                const int ya1 = (int)(anchors[k * 4 + 3] + ya * yRatio);

                const int wa = xa1 - xa0;
                const int ha = ya1 - ya0;

                const float xac = xa0 + wa / 2.0f;
                const float yac = ya0 + ha / 2.0f;
                const float predPartY = (partY * ha + yac) * yOutputRatio;
                const float predPartX = (partX * wa + xac) * xOutputRatio;

                const int partsOffset = ptIdx * 2 + 6;
                outputs[partsOffset + baseOutputIdx] = predPartY;
                outputs[partsOffset + 1 + baseOutputIdx] = predPartX;
            }
            else if (ptIdx < maxParts && totalParts > 0) {
                const int partsOffset = ptIdx * 2 + 6;
                outputs[partsOffset + baseOutputIdx] = 0.0;
                outputs[partsOffset + 1 + baseOutputIdx] = 0.0;
            }

            if (ptIdx < nbTemplates && totalTemplates > 0) {
                const unsigned int xa = roi_anchors[0 + 5*proposal + batchPos*nbProposals*5];
                const unsigned int ya = roi_anchors[1 + 5*proposal + batchPos*nbProposals*5];
                const unsigned int k  = roi_anchors[2 + 5*proposal + batchPos*nbProposals*5];

                const int tempOffset = (k * nbTemplates * 3 + cumulTemplates + ptIdx * 3) * channelHeight * channelWidth;
                const int batchTempOffset = batchPos * channelHeight * channelWidth * nbAnchors * 3 * totalTemplates;

                const int yIdx = xa + ya * channelWidth + tempOffset + batchTempOffset;
                const int xIdx = yIdx + channelHeight * channelWidth;
                const int zIdx = xIdx + channelHeight * channelWidth;

                const float templateY = expf(inputs_templates[yIdx]);
                const float templateX = expf(inputs_templates[xIdx]);
                const float templateZ = expf(inputs_templates[zIdx]);

                const int templatesOffset = ptIdx * 3 + maxParts * 2 + 6;
                outputs[templatesOffset + baseOutputIdx] = templateY;
                outputs[templatesOffset + 1 + baseOutputIdx] = templateX;
                outputs[templatesOffset + 2 + baseOutputIdx] = templateZ;
            }
            else if (ptIdx < maxTemplates && totalTemplates > 0) {
                const int templatesOffset = ptIdx * 3 + maxParts * 2 + 6;
                outputs[templatesOffset + baseOutputIdx] = 0.0;
                outputs[templatesOffset + 1 + baseOutputIdx] = 0.0;
                outputs[templatesOffset + 2 + baseOutputIdx] = 0.0;
            }
        }
        else {
            for (int i = 0; i < 5; ++i) {
                outputs[i + baseOutputIdx] = 0.0;
            }

            if (ptIdx < maxParts && totalParts > 0) {
                const int partsOffset = ptIdx * 2 + 6;
                outputs[partsOffset + baseOutputIdx] = 0.0;
                outputs[partsOffset + 1 + baseOutputIdx] = 0.0;
            }

            if (ptIdx < maxTemplates && totalTemplates > 0) {
                const int templatesOffset = ptIdx * 3 + maxParts * 2 + 6;
                for (int i = 0; i < 3; ++i) {
                    outputs[templatesOffset + i + baseOutputIdx] = 0.0;
                }
            }
        }
    }
}