#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void WriteClockValues(unsigned int *completionTimes, unsigned int *threadIDs) {
    // Simplified calculation of unique global index for each thread
    size_t globalThreadIndex = blockIdx.z * gridDim.y * gridDim.x * blockDim.z * blockDim.y * blockDim.x +
                               blockIdx.y * gridDim.x * blockDim.z * blockDim.y * blockDim.x +
                               blockIdx.x * blockDim.z * blockDim.y * blockDim.x +
                               threadIdx.z * blockDim.y * blockDim.x +
                               threadIdx.y * blockDim.x +
                               threadIdx.x;

    // Record clock value and thread ID
    completionTimes[globalThreadIndex] = clock();
    threadIDs[globalThreadIndex] = (threadIdx.y << 4) | threadIdx.x;
}