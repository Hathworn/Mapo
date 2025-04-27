#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void scan(float *input, float *output, int len) {
    __shared__ float data[BLOCK_SIZE];

    // Load elements into shared memory.
    int tid = threadIdx.x;
    int index = blockIdx.x * blockDim.x + tid;
    if (index < len) {
        data[tid] = input[index];
    } else {
        data[tid] = 0.0f; // Initialize out-of-bound threads to zero
    }
    __syncthreads();

    // Perform exclusive scan within the block.
    for (int offset = 1; offset < blockDim.x; offset *= 2) {
        float temp = 0.0f;
        if (tid >= offset) {
            temp = data[tid - offset];
        }
        __syncthreads();
        data[tid] += temp;
        __syncthreads();
    }

    // Write results to output array.
    if (index < len) {
        output[index] = data[tid];
    }
}