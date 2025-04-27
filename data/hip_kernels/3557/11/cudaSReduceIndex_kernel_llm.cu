#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaSReduceIndex_kernel(const unsigned int inputSize, const unsigned int inputBatchOffset, const unsigned int outputBatchOffset, const unsigned int channelsWidth, const unsigned int channelsHeight, const unsigned int nbAnchors, const float* valueThreshold, const float* inputs, int* outputMap, float* scores)
{
    const int batchPos = blockIdx.z;
    const int clsPos = blockIdx.y;

    // Calculate the index using shared memory for faster access
    __shared__ float sharedValueThreshold;
    if (threadIdx.x == 0) {
        sharedValueThreshold = valueThreshold[clsPos];
    }
    __syncthreads();

    const int index = (threadIdx.x & 0x1f) + blockIdx.x * blockDim.x;
    const int inputIndex = index + inputSize * clsPos + batchPos * inputBatchOffset;
    const int outputIndex = index + inputSize * clsPos + batchPos * outputBatchOffset;

    if (index < inputSize) {
        float value = inputs[inputIndex];

        // Use ternary operator for concise conditional assignment
        int outputMapValue = (value >= sharedValueThreshold) ? index : -255;
        float scoreValue = (value >= sharedValueThreshold) ? value : -255.0;

        outputMap[outputIndex] = outputMapValue;
        scores[outputIndex] = scoreValue;
    }
}