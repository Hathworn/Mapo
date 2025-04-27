#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void CumulateThroughTimeKernel(float* memoryBlocks, int count, int sequenceLength)
{
    // Calculate memory index for this thread
    int memoryIdx = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x;
    
    // Check if memory index is within bounds
    if (memoryIdx < count)
    {
        // Load initial value outside loop for better performance
        float cumulativeSum = memoryBlocks[memoryIdx];

        // Loop through sequenceTime and accumulate values
        for (size_t i = 1; i < sequenceLength; i++)
        {
            int memoryBlockOffset = i * count;
            cumulativeSum += memoryBlocks[memoryBlockOffset + memoryIdx];
        }

        // Store cumulative sum back to memoryBlocks
        memoryBlocks[memoryIdx] = cumulativeSum;
    }
}