#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void WriteClockValues(unsigned int *completionTimes, unsigned int *threadIDs)
{
    // Pre-compute values outside the loop
    size_t blockId = blockIdx.x + gridDim.x * (blockIdx.y + gridDim.y * blockIdx.z);
    size_t threadId = threadIdx.x + blockDim.x * (threadIdx.y + blockDim.y * threadIdx.z);

    size_t totalBlockSize = blockDim.x * blockDim.y * blockDim.z;
    size_t globalIndex = blockId * totalBlockSize + threadId;

    // Assign the current clock cycle to the globalIndex position
    completionTimes[globalIndex] = clock(); 

    // Compact thread ID calculation
    threadIDs[globalIndex] = (threadIdx.y << 4) | threadIdx.x;
}