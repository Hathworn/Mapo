#include "hip/hip_runtime.h"
#include "includes.h"

// Optimization: Use shared memory to reduce global memory access latency
extern "C"
__global__ void recipSummation(double* data, double* recip, int len)
{
    extern __shared__ double shared_recip[]; // Shared memory for recip
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int totalThreads = gridDim.x * blockDim.x * gridDim.y;

    for (int i = x; i < len; i += totalThreads) {
        shared_recip[threadIdx.x] = recip[i]; // Load recip into shared memory
        __syncthreads(); // Synchronize within the block

        const int j = 2 * i;
        data[j]     *= shared_recip[threadIdx.x];
        data[j + 1] *= shared_recip[threadIdx.x];
        __syncthreads(); // Ensure all threads have processed the current slice
    }
}