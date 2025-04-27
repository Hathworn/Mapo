#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAdd_contiguous(float* a, float* b, float* dest, unsigned int numEls) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;

    // Use shared memory to improve memory access efficiency
    __shared__ float sharedA[1024];  // Assumes blockDim.x <= 1024
    __shared__ float sharedB[1024];  // Assumes blockDim.x <= 1024

    for (unsigned int i = idx; i < numEls; i += numThreads) {
        // Load data into shared memory
        sharedA[threadIdx.x] = a[i];
        sharedB[threadIdx.x] = b[i];
        __syncthreads();  // Ensure all threads have loaded their data

        // Perform addition
        dest[i] = sharedA[threadIdx.x] + sharedB[threadIdx.x];
    }
}