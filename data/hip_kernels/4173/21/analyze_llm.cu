#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void analyze(const float *input, float *sum, int numElements) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory for reducing frequent global memory access
    __shared__ float cache[256]; // assuming blockDim.x = 256
    if (i < numElements) {
        cache[threadIdx.x] = input[i];
    } else {
        cache[threadIdx.x] = 0.0f; // Handle out-of-bounds threads
    }
    __syncthreads();

    // Perform reduction within the block
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (threadIdx.x < stride) {
            cache[threadIdx.x] += cache[threadIdx.x + stride];
        }
        __syncthreads();
    }

    // Write the result of this block to global memory
    if (threadIdx.x == 0) {
        atomicAdd(sum, cache[0]);
    }
}