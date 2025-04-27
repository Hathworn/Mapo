#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduction(int* input, int* output) {
    __shared__ int tmp[TPB];

    // Load data into shared memory
    int index = threadIdx.x + blockIdx.x * blockDim.x;
    tmp[threadIdx.x] = input[index];
    __syncthreads();

    // Perform unrolled reduction in shared memory
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (threadIdx.x < stride) {
            tmp[threadIdx.x] += tmp[threadIdx.x + stride];
        }
        __syncthreads();
    }

    // Write result for this block to global memory
    if (threadIdx.x == 0) {
        output[blockIdx.x] = tmp[0];
    }
}