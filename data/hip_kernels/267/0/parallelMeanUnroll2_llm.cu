```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void parallelMeanUnroll2(float* d_inputArray, uint64_t inputLength, float* d_outputMean)
{
    uint32_t localThreadIndex = threadIdx.x;
    uint32_t globalThreadIndex = blockIdx.x * blockDim.x + localThreadIndex;
    uint32_t sumDataIndex = blockIdx.x * blockDim.x * 2 + localThreadIndex; // Data index for summation

    // Pointer to the block's data
    float* localBlockPointer = d_inputArray + blockIdx.x * blockDim.x * 2;

    // Unrolled addition for better performance, no bounds checking required via shifted index
    if (sumDataIndex + blockDim.x < inputLength)
    {
        localBlockPointer[localThreadIndex] = d_inputArray[sumDataIndex] + d_inputArray[sumDataIndex + blockDim.x];
    }

    // Sync threads within block
    __syncthreads();

    // Optimized in-place reduction using shared pointer, no extra memory access
    for (uint32_t stride = blockDim.x / 2; stride > 0; stride >>= 1)
    {
        if (localThreadIndex < stride)
        {
            localBlockPointer[localThreadIndex] += localBlockPointer[localThreadIndex + stride];
        }
        // Sync within reduction loops to ensure data consistency
        __syncthreads();
    }

    // Global mean calculation by first thread only
    if (globalThreadIndex == 0)
    {
        // Accumulating results from all blocks
        float blockSum = 0;
        for (uint32_t i = 0; i < gridDim.x; ++i)
        {
            blockSum += d_inputArray[i * blockDim.x * 2]; // Times 2 for double blocks data
        }

        // Mean computation
        *d_outputMean = blockSum / (inputLength - 1);
    }
}