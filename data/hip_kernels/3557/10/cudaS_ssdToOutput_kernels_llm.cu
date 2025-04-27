#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaS_ssdToOutput_kernels(
    unsigned int batchSize, unsigned int nbClass, unsigned int nbAnchors, unsigned int channelWidth,
    unsigned int channelHeight, unsigned int nbProposals, unsigned int* nbValidROIs, unsigned int cls,
    unsigned int totalParts, unsigned int totalTemplates, unsigned int maxParts, unsigned int maxTemplates,
    unsigned int cumulParts, unsigned int cumulTemplates, unsigned int nbParts, unsigned int nbTemplates,
    float xRatio, float yRatio, float xOutputRatio, float yOutputRatio, const float* roi_bbox,
    const float* roi_anchors, const float* anchors, const float* inputs_parts, const float* inputs_templates, float* outputs)
{
    const int batchPos = blockIdx.z;
    const int proposal = (threadIdx.x & 0x1f) + blockIdx.x * blockDim.x;
    const int ptIdx = blockIdx.y;

    const int nbDetectedObject = static_cast<int>(nbValidROIs[batchPos]);
    const int nbIdx = 6;

    if (proposal < nbProposals)
    {
        const unsigned int n = proposal + cls * nbProposals + batchPos * nbProposals * nbClass;

        if (proposal < nbDetectedObject)
        {
            if (ptIdx == 0)
            {
                // Copy bbox data
                for (int i = 0; i < 5; ++i)
                {
                    outputs[i + n * (nbIdx + maxParts * 2 + maxTemplates * 3)] =
                        roi_bbox[i + 5 * proposal + batchPos * nbProposals * 5];
                }
                outputs[5 + n * (nbIdx + maxParts * 2 + maxTemplates * 3)] = static_cast<float>(cls);
            }

            if (ptIdx < nbParts && nbParts > 0)
            {
                // Calculate part prediction
                const unsigned int xa = roi_anchors[0 + 5 * proposal + batchPos * nbProposals * 5];
                const unsigned int ya = roi_anchors[1 + 5 * proposal + batchPos * nbProposals * 5];
                const unsigned int k = roi_anchors[2 + 5 * proposal + batchPos * nbProposals * 5];

                const int offset = xa + ya * channelWidth + (k * nbParts * 2 + cumulParts + ptIdx * 2) * channelHeight * channelWidth;
                const int partIdx = offset + batchPos * channelHeight * channelWidth * nbAnchors * 2 * totalParts;
                const float partY = inputs_parts[partIdx];
                const float partX = inputs_parts[partIdx + 1];

                // Calculate anchor properties
                const int xa0 = static_cast<int>(anchors[cls * nbAnchors * 4 + k * 4] + xa * xRatio);
                const int ya0 = static_cast<int>(anchors[cls * nbAnchors * 4 + k * 4 + 1] + ya * yRatio);
                const int xa1 = static_cast<int>(anchors[cls * nbAnchors * 4 + k * 4 + 2] + xa * xRatio);
                const int ya1 = static_cast<int>(anchors[cls * nbAnchors * 4 + k * 4 + 3] + ya * yRatio);

                const int wa = xa1 - xa0;
                const int ha = ya1 - ya0;
                const float xac = xa0 + wa / 2.0;
                const float yac = ya0 + ha / 2.0;
                const float predPartY = (partY * ha + yac) * yOutputRatio;
                const float predPartX = (partX * wa + xac) * xOutputRatio;

                outputs[ptIdx * 2 + nbIdx + n * (nbIdx + maxParts * 2 + maxTemplates * 3)] = predPartY;
                outputs[ptIdx * 2 + nbIdx + 1 + n * (nbIdx + maxParts * 2 + maxTemplates * 3)] = predPartX;
            }
            else if (ptIdx < maxParts && maxParts > 0)
            {
                // Fill remaining parts with zeros
                outputs[ptIdx * 2 + nbIdx + n * (nbIdx + maxParts * 2 + maxTemplates * 3)] = 0.0f;
                outputs[ptIdx * 2 + nbIdx + 1 + n * (nbIdx + maxParts * 2 + maxTemplates * 3)] = 0.0f;
            }
            
            if (ptIdx < nbTemplates && nbTemplates > 0)
            {
                // Calculate template prediction
                const unsigned int xa = roi_anchors[0 + 5 * proposal + batchPos * nbProposals * 5];
                const unsigned int ya = roi_anchors[1 + 5 * proposal + batchPos * nbProposals * 5];
                const unsigned int k = roi_anchors[2 + 5 * proposal + batchPos * nbProposals * 5];

                const int offset = xa + ya * channelWidth + (k * nbTemplates * 3 + cumulTemplates + ptIdx * 3) * channelHeight * channelWidth;
                const int templateIdx = offset + batchPos * channelHeight * channelWidth * nbAnchors * 3 * totalTemplates;
                
                const float templateY = expf(inputs_templates[templateIdx]);
                const float templateX = expf(inputs_templates[templateIdx + 1]);
                const float templateZ = expf(inputs_templates[templateIdx + 2]);

                outputs[ptIdx * 3 + maxParts * 2 + nbIdx + n * (nbIdx + maxParts * 2 + maxTemplates * 3)] = templateY;
                outputs[ptIdx * 3 + maxParts * 2 + nbIdx + 1 + n * (nbIdx + maxParts * 2 + maxTemplates * 3)] = templateX;
                outputs[ptIdx * 3 + maxParts * 2 + nbIdx + 2 + n * (nbIdx + maxParts * 2 + maxTemplates * 3)] = templateZ;
            }
            else if (ptIdx < maxTemplates && maxTemplates > 0)
            {
                // Fill remaining templates with zeros
                outputs[ptIdx * 3 + maxParts * 2 + nbIdx + n * (nbIdx + maxParts * 2 + maxTemplates * 3)] = 0.0f;
                outputs[ptIdx * 3 + maxParts * 2 + nbIdx + 1 + n * (nbIdx + maxParts * 2 + maxTemplates * 3)] = 0.0f;
                outputs[ptIdx * 3 + maxParts * 2 + nbIdx + 2 + n * (nbIdx + maxParts * 2 + maxTemplates * 3)] = 0.0f;
            }
        }
        else
        {
            // Fill the output with zeros for invalid proposals
            for (int i = 0; i < nbIdx; ++i)
            {
                outputs[i + n * (nbIdx + maxParts * 2 + maxTemplates * 3)] = 0.0f;
            }

            if (ptIdx < maxParts && maxParts > 0)
            {
                outputs[ptIdx * 2 + nbIdx + n * (nbIdx + maxParts * 2 + maxTemplates * 3)] = 0.0f;
                outputs[ptIdx * 2 + nbIdx + 1 + n * (nbIdx + maxParts * 2 + maxTemplates * 3)] = 0.0f;
            }

            if (ptIdx < maxTemplates && maxTemplates > 0)
            {
                outputs[ptIdx * 3 + maxParts * 2 + nbIdx + n * (nbIdx + maxParts * 2 + maxTemplates * 3)] = 0.0f;
                outputs[ptIdx * 3 + maxParts * 2 + nbIdx + 1 + n * (nbIdx + maxParts * 2 + maxTemplates * 3)] = 0.0f;
                outputs[ptIdx * 3 + maxParts * 2 + nbIdx + 2 + n * (nbIdx + maxParts * 2 + maxTemplates * 3)] = 0.0f;
            }
        }
    }
}