#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaSGatherRP_kernel(unsigned int inputSizeX, unsigned int inputSizeY, unsigned int nbAnchors, unsigned int batchSize, const float* inputs, const int* i, const int* j, const int* k, const int* b, const int* mask, float* outputs, int* anchors, unsigned int topN, const unsigned int nbProposals)
{
    const int batchPos = blockIdx.z;
    const int sortOffset = batchPos * topN;
    const int index = (threadIdx.x & 0x1f) + blockIdx.x * blockDim.x;
    const int totalIndex = index + sortOffset;
    const int batchIndex = index + batchPos * nbProposals;

    if (index < nbProposals) {
        // Precompute common expressions for reuse
        int maskVal = mask[totalIndex + sortOffset];

        unsigned int commonOffset1 = maskVal * inputSizeX;
        unsigned int commonOffset2 = maskVal * inputSizeX * inputSizeY;

        unsigned int baseOffset = b[maskVal] * nbAnchors * commonOffset2 * 6;

        unsigned int xIdx = commonOffset1 + j[maskVal] * inputSizeX + (k[maskVal] + nbAnchors) * commonOffset2 + baseOffset;
        unsigned int yIdx = commonOffset1 + j[maskVal] * inputSizeX + (k[maskVal] + 2 * nbAnchors) * commonOffset2 + baseOffset;
        unsigned int wIdx = commonOffset1 + j[maskVal] * inputSizeX + (k[maskVal] + 3 * nbAnchors) * commonOffset2 + baseOffset;
        unsigned int hIdx = commonOffset1 + j[maskVal] * inputSizeX + (k[maskVal] + 4 * nbAnchors) * commonOffset2 + baseOffset;

        anchors[0 + (batchIndex) * 4] = i[maskVal];
        anchors[1 + (batchIndex) * 4] = j[maskVal];
        anchors[2 + (batchIndex) * 4] = k[maskVal];
        anchors[3 + (batchIndex) * 4] = b[maskVal];

        outputs[0 + (batchIndex) * 4] = inputs[xIdx];
        outputs[1 + (batchIndex) * 4] = inputs[yIdx];
        outputs[2 + (batchIndex) * 4] = inputs[wIdx];
        outputs[3 + (batchIndex) * 4] = inputs[hIdx];
    }
}