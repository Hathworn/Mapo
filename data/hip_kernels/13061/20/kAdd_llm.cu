#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void kAdd(float* a, float* b, float* dest, unsigned int numEls, float scaleA, float scaleB) {
    // Use shared memory to reduce global memory accesses
    __shared__ float sharedA[256];
    __shared__ float sharedB[256];

    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;

    for (unsigned int i = idx; i < numEls; i += numThreads) {
        // Load data into shared memory
        sharedA[threadIdx.x] = a[i];
        sharedB[threadIdx.x] = b[i];

        __syncthreads();

        // Perform the computation using shared memory
        dest[i] = scaleA * sharedA[threadIdx.x] + scaleB * sharedB[threadIdx.x];

        __syncthreads();
    }
}