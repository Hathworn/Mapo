#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaSGatherRP_kernel(unsigned int inputSizeX, unsigned int inputSizeY, unsigned int nbAnchors, unsigned int batchSize,
                                     const float* inputs, const float* i, const float* j, const float* k, const float* b, const int* mask,
                                     float* outputs, const unsigned int topN, const unsigned int nbProposals)
{
    const int batchPos = blockIdx.z;
    const int sortOffset = batchPos * topN;
    int index = (threadIdx.x & 0x1f) + blockIdx.x * blockDim.x;
    const int totalIndex = index + sortOffset;
    const int batchIndex = index + batchPos * nbProposals;

    if (index < nbProposals)
    {
        // Compute indices for each dimension using reused mask offset
        unsigned int maskOffset = mask[totalIndex] + sortOffset;
        unsigned int anchorOffset = nbAnchors * inputSizeX * inputSizeY;

        unsigned int xIdx = i[maskOffset] + j[maskOffset] * inputSizeX + (k[maskOffset] + nbAnchors) * anchorOffset + b[maskOffset] * nbAnchors * anchorOffset * 6;
        unsigned int yIdx = i[maskOffset] + j[maskOffset] * inputSizeX + (k[maskOffset] + 2 * nbAnchors) * anchorOffset + b[maskOffset] * nbAnchors * anchorOffset * 6;
        unsigned int wIdx = i[maskOffset] + j[maskOffset] * inputSizeX + (k[maskOffset] + 3 * nbAnchors) * anchorOffset + b[maskOffset] * nbAnchors * anchorOffset * 6;
        unsigned int hIdx = i[maskOffset] + j[maskOffset] * inputSizeX + (k[maskOffset] + 4 * nbAnchors) * anchorOffset + b[maskOffset] * nbAnchors * anchorOffset * 6;

        // Store results in outputs using offsets in a single operation per proposal
        outputs[0 + (batchIndex) * 4] = inputs[xIdx];
        outputs[1 + (batchIndex) * 4] = inputs[yIdx];
        outputs[2 + (batchIndex) * 4] = inputs[wIdx];
        outputs[3 + (batchIndex) * 4] = inputs[hIdx];
    }
}