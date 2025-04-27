#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduction(int * in, int * out) {
    int globalid = blockIdx.x * blockDim.x + threadIdx.x;
    __shared__ int s_array[BLOCK_DIM];

    // Load elements into shared memory
    s_array[threadIdx.x] = in[globalid];
    __syncthreads();

    // Perform reduction using shared memory with stride loop unrolling
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (threadIdx.x < stride) {
            s_array[threadIdx.x] += s_array[threadIdx.x + stride];
        }
        __syncthreads();
    }

    // Write the block's result
    if (threadIdx.x == 0) {
        out[blockIdx.x] = s_array[0];
    }
}