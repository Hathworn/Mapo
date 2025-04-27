#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAdd_contiguous(float* a, float* b, float* dest, unsigned int numEls) {
    // Use shared memory for block-wise processing to improve memory access patterns
    __shared__ float s_a[256];
    __shared__ float s_b[256];

    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;

    for (unsigned int i = idx; i < numEls; i += numThreads) {
        s_a[threadIdx.x] = a[i];
        s_b[threadIdx.x] = b[i];
        __syncthreads(); // Ensure all threads have loaded before continuing

        dest[i] = s_a[threadIdx.x] + s_b[threadIdx.x];

        __syncthreads(); // Ensure all threads have written before next iteration
    }
}