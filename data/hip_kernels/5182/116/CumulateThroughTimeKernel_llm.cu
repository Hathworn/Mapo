#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void CumulateThroughTimeKernel(float* memoryBlocks, int count, int sequenceLength)
{
    int memoryIdx = blockDim.x * blockIdx.y * gridDim.x
                    + blockDim.x * blockIdx.x
                    + threadIdx.x;

    // Optimize by moving invariant calculation out of the loop
    if (memoryIdx < count)
    {
        float cumulatedValue = memoryBlocks[memoryIdx];
        for (size_t i = 1; i < sequenceLength; i++)
        {
            int memoryBlockOffset = i * count;
            cumulatedValue += memoryBlocks[memoryBlockOffset + memoryIdx];
        }
        memoryBlocks[memoryIdx] = cumulatedValue;
    }
}