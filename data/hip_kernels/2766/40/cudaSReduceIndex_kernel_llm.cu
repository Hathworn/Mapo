#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaSReduceIndex_kernel(const unsigned int inputSize, const unsigned int inputBatchOffset, const unsigned int outputBatchOffset, const float* __restrict__ valueThreshold, const float* __restrict__ inputs, int* __restrict__ outputMap, float* __restrict__ scores)
{
    const int batchPos = blockIdx.z;
    const int clsPos = blockIdx.y;
    const int index = (threadIdx.x & 0x1f) + blockIdx.x * blockDim.x;

    // Calculate indices once, reuse in both branches
    const int inputIndex = index + inputSize * clsPos + batchPos * inputBatchOffset;
    const int outputIndex = index + inputSize * clsPos + batchPos * outputBatchOffset;

    if(index < inputSize)
    {
        float value = inputs[inputIndex];

        // Simplify branch with ternary operator
        outputMap[outputIndex] = (value >= valueThreshold[clsPos]) ? index : -1;
        scores[outputIndex] = (value >= valueThreshold[clsPos]) ? value : -1.0;
    }
}