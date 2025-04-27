#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduction(int* input, int* output) {
    __shared__ int tmp[TPB];

    // Load input into shared memory
    unsigned int tid = threadIdx.x;
    unsigned int index = tid + blockIdx.x * blockDim.x;
    tmp[tid] = input[index];

    __syncthreads();

    // Reduce using loop unrolling
    for (unsigned int stride = blockDim.x / 2; stride > 0; stride /= 2) {
        if (tid < stride) {
            tmp[tid] += tmp[tid + stride];
        }
        __syncthreads();
    }

    // Write result for this block to output
    if (tid == 0) {
        output[blockIdx.x] = tmp[0];
    }
}