#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void degreeCalc(int *array) {
    // Initialize shared memory for thread-safe accumulation
    extern __shared__ int sharedSum[];
    int tid = threadIdx.x;
    int i = blockDim.x * blockIdx.x + tid;

    sharedSum[tid] = (i < 1000000) ? array[i] : 0;
    __syncthreads();

    // Reduce within block
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (tid < stride) {
            sharedSum[tid] += sharedSum[tid + stride];
        }
        __syncthreads();
    }

    // Only one thread updates the global sum
    if (tid == 0) {
        atomicAdd(&sum, sharedSum[0]);
    }
}

__global__ void degreeCalc(int *vertexArray, int *neighbourArray, int *degreeCount, int n, int m) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Ensure i is within bounds
    if (i < n) {
        int start = vertexArray[i];
        int stop = vertexArray[i + 1];
        degreeCount[i] = stop - start; // Directly calculate diff within the assignment
    }
}