#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAdd_contiguous(float* a, float* b, float* dest, unsigned int numEls) {
    // Use shared memory to improve cache efficiency
    __shared__ float shared_a[256];
    __shared__ float shared_b[256];

    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;

    for (unsigned int i = idx; i < numEls; i += numThreads) {
        // Load elements into shared memory
        shared_a[threadIdx.x] = a[i];
        shared_b[threadIdx.x] = b[i];
        __syncthreads();

        // Perform addition
        dest[i] = shared_a[threadIdx.x] + shared_b[threadIdx.x];
        __syncthreads();
    }
}