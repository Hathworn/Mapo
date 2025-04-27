#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduce_sum_kernel(const float *input, float *d_out, int size) {
    int tid = threadIdx.x; // Local thread index
    int myId = blockIdx.x * (blockDim.x * 2) + threadIdx.x; // Global thread index

    extern __shared__ float tempsum[]; // shared memory

    // Load data into shared memory
    if (myId + blockDim.x < size) {
        tempsum[tid] = input[myId] + input[myId + blockDim.x];
    } else if (myId < size) {
        tempsum[tid] = input[myId];
    } else {
        tempsum[tid] = 0.0f;
    }

    __syncthreads(); // Ensure all shared memory loads are completed

    // Perform reduction using shared memory
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            tempsum[tid] += tempsum[tid + s];
        }
        __syncthreads(); // Ensure all memory operations are completed
    }

    // Write the result of block reduction to output
    if (tid == 0) {
        d_out[blockIdx.x] = tempsum[0];
    }
}