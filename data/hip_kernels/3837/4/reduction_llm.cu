#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduction(int* input, int* output) {
    __shared__ int tmp[TPB];

    // Load input elements into shared memory
    tmp[threadIdx.x] = input[threadIdx.x + blockIdx.x * blockDim.x];
    __syncthreads();

    // Perform reduction using loop to minimize code repetition and syncthreads calls
    for (int stride = blockDim.x / 2; stride > 0; stride /= 2) {
        if (threadIdx.x < stride) {
            tmp[threadIdx.x] += tmp[threadIdx.x + stride];
        }
        __syncthreads();
    }

    // Write the result for this block to global memory
    if (threadIdx.x == 0) {
        output[blockIdx.x] = tmp[0];
    }
}