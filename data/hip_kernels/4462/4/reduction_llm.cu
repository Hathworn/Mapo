#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduction(int* input, int* output) {
    __shared__ int tmp[TPB];

    // Load input into shared memory
    int tid = threadIdx.x;
    int index = tid + blockIdx.x * blockDim.x;
    tmp[tid] = input[index];
    __syncthreads();

    // Block-wide reduction using a loop
    // Unroll loop for further optimization
    for (unsigned int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (tid < stride) {
            tmp[tid] += tmp[tid + stride];
        }
        __syncthreads();
    }

    // Write result for this block to global memory
    if (tid == 0) {
        output[blockIdx.x] = tmp[0];
    }
}