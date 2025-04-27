#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAdd_contiguous(float* a, float* b, float* dest, unsigned int numEls) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;

    // Use shared memory to reduce global memory access and improve performance
    __shared__ float shared_a[256]; // Assuming blockDim.x = 256 for simplicity
    __shared__ float shared_b[256];

    for (unsigned int i = idx; i < numEls; i += numThreads) {
        shared_a[threadIdx.x] = a[i];
        shared_b[threadIdx.x] = b[i];
        __syncthreads(); // Synchronize threads within the block

        dest[i] = shared_a[threadIdx.x] + shared_b[threadIdx.x];
        __syncthreads(); // Ensure all threads have completed writing to dest
    }
}