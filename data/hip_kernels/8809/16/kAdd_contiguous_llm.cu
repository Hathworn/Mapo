#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAdd_contiguous(float* a, float* b, float* dest, unsigned int numEls) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;

    // Use shared memory to optimize memory access patterns
    __shared__ float sharedA[256];
    __shared__ float sharedB[256];

    for (unsigned int i = idx; i < numEls; i += numThreads) {
        // Load data into shared memory
        sharedA[threadIdx.x] = a[i];
        sharedB[threadIdx.x] = b[i];
        __syncthreads(); // Ensure all threads have loaded their data

        // Perform the computation
        dest[i] = sharedA[threadIdx.x] + sharedB[threadIdx.x];
        __syncthreads(); // Ensure all threads have written their results
    }
}