#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAdd_contiguous(float* a, float* b, float* dest, unsigned int numEls) {
    // Calculate global index based on block and thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Optimize by using shared memory for better memory access pattern
    __shared__ float shared_a[256];
    __shared__ float shared_b[256];

    const unsigned int threadLane = threadIdx.x;

    if (idx < numEls) {
        // Load data into shared memory
        shared_a[threadLane] = a[idx];
        shared_b[threadLane] = b[idx];
        __syncthreads();

        // Perform computation using shared memory
        dest[idx] = shared_a[threadLane] + shared_b[threadLane];
    }
}