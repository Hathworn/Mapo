#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaSReduceIndex_kernel(const unsigned int inputSize, const unsigned int inputBatchOffset, const unsigned int outputBatchOffset, const float* valueThreshold, const float* inputs, int* outputMap, float* scores)
{
    // Compute global index using block and thread index
    const int batchPos = blockIdx.z;
    const int clsPos = blockIdx.y;
    const int index = (threadIdx.x & 0x1f) + blockIdx.x * blockDim.x;

    // Calculate input and output indices
    const int inputIndex = index + inputSize * clsPos + batchPos * inputBatchOffset;
    const int outputIndex = index + inputSize * clsPos + batchPos * outputBatchOffset;

    // Check if index is within input size
    if (index < inputSize)
    {
        float value = inputs[inputIndex];

        // Use ternary operator to simplify conditional assignments
        outputMap[outputIndex] = (value >= valueThreshold[clsPos]) ? index : -1;
        scores[outputIndex] = (value >= valueThreshold[clsPos]) ? value : -1.0f;
    }
}