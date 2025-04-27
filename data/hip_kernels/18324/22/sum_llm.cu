#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sum(const float *input, float *output, int numElements) {
    float val = 0.f;
    int threadId = threadIdx.x + blockIdx.x * blockDim.x;
    // Process elements in parallel with stride
    for (int i = threadId; i < numElements; i += blockDim.x * gridDim.x) {
        val += input[i];
    }

    // Store partial result in shared memory
    __shared__ float sharedMemory[256];
    int laneId = threadIdx.x;
    sharedMemory[laneId] = val;

    // Ensure all warps have written their results
    __syncthreads();

    // Reduce within block
    if (laneId < 128) sharedMemory[laneId] += sharedMemory[laneId + 128];
    __syncthreads();
    if (laneId < 64) sharedMemory[laneId] += sharedMemory[laneId + 64];
    __syncthreads();
    if (laneId < 32) {
        sharedMemory[laneId] += sharedMemory[laneId + 32];
        sharedMemory[laneId] += sharedMemory[laneId + 16];
        sharedMemory[laneId] += sharedMemory[laneId + 8];
        sharedMemory[laneId] += sharedMemory[laneId + 4];
        sharedMemory[laneId] += sharedMemory[laneId + 2];
        sharedMemory[laneId] += sharedMemory[laneId + 1];
    }

    // Output result from thread 0 of each block
    if (laneId == 0) {
        atomicAdd(output, sharedMemory[0]);
    }
}