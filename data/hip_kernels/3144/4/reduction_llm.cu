#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduction(int* input, int* output) {
    __shared__ int tmp[TPB];

    // Each thread loads one element from global to shared memory
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    tmp[threadIdx.x] = input[idx];

    __syncthreads();

    // Perform reduction in shared memory
    for (unsigned int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
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