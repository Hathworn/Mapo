#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAdd_contiguous(float* a, float* b, float* dest, unsigned int numEls) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;

    // Use shared memory to optimize memory access and reduce global memory access latency
    __shared__ float a_shared[256];
    __shared__ float b_shared[256];

    for (unsigned int i = idx; i < numEls; i += numThreads) {
        // Load data into shared memory for the current block
        a_shared[threadIdx.x] = a[i];
        b_shared[threadIdx.x] = b[i];
        __syncthreads(); // Ensure all threads have loaded data to shared memory

        // Compute result using shared memory
        dest[i] = a_shared[threadIdx.x] + b_shared[threadIdx.x];
        __syncthreads(); // Ensure all computations are done before next iteration
    }
}