#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduction(int* input, int* output) {
    // Load data into shared memory
    __shared__ int tmp[TPB];
    int tid = threadIdx.x;
    int offset = blockIdx.x * blockDim.x + tid;
    tmp[tid] = input[offset];
    __syncthreads();

    // Perform reduction with warp unrolling
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (tid < stride)
            tmp[tid] += tmp[tid + stride];
        __syncthreads();
    }

    // Write the result for this block
    if (tid == 0) {
        output[blockIdx.x] = tmp[0];
    }
}