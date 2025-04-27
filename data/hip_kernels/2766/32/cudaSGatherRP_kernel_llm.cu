#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaSGatherRP_kernel(unsigned int inputSizeX, unsigned int inputSizeY, unsigned int nbAnchors, unsigned int batchSize, const float* inputs, const int* i, const int* j, const int* k, const int* b, const int* mask, float* outputs, int* anchors, unsigned int topN, const unsigned int nbProposals)
{
    // Calculate indices
    const int batchPos = blockIdx.z;
    const int sortOffset = batchPos * topN;
    const int index = (threadIdx.x & 0x1f) + blockIdx.x * blockDim.x;
    if (index >= nbProposals) return; // Return early if out of bounds

    const int totalIndex = index + sortOffset;
    const int batchIndex = index + batchPos * nbProposals;
    const int maskIndex = mask[totalIndex] + sortOffset;

    // Pre-calculate common terms
    const int inputSizeXY = inputSizeX * inputSizeY;
    const int anchorOffset = b[maskIndex] * nbAnchors * inputSizeXY * 6;

    // Compute indices
    unsigned int baseIdx = i[maskIndex] + j[maskIndex] * inputSizeX;
    unsigned int xIdx = baseIdx + (k[maskIndex] + nbAnchors) * inputSizeXY + anchorOffset;
    unsigned int yIdx = baseIdx + (k[maskIndex] + 2 * nbAnchors) * inputSizeXY + anchorOffset;
    unsigned int wIdx = baseIdx + (k[maskIndex] + 3 * nbAnchors) * inputSizeXY + anchorOffset;
    unsigned int hIdx = baseIdx + (k[maskIndex] + 4 * nbAnchors) * inputSizeXY + anchorOffset;

    // Store results
    int offset = batchIndex * 4;
    anchors[offset] = i[maskIndex];
    anchors[offset + 1] = j[maskIndex];
    anchors[offset + 2] = k[maskIndex];
    anchors[offset + 3] = b[maskIndex];

    outputs[offset] = inputs[xIdx];
    outputs[offset + 1] = inputs[yIdx];
    outputs[offset + 2] = inputs[wIdx];
    outputs[offset + 3] = inputs[hIdx];
}