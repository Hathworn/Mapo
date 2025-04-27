#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduction(int* input, int* output) {
    __shared__ int tmp[TPB];

    int tid = threadIdx.x;
    int index = threadIdx.x + blockIdx.x * blockDim.x;

    // Load input into shared memory
    tmp[tid] = input[index];
    __syncthreads();

    // Unroll the loop to reduce instructions
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (tid < stride) {
            tmp[tid] += tmp[tid + stride];
        }
        __syncthreads();
    }

    // Write the reduced value for this block to global memory
    if (tid == 0) {
        output[blockIdx.x] = tmp[0];
    }
}