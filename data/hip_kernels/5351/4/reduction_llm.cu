#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduction(int* input, int* output) {
    __shared__ int tmp[TPB];

    // Load input into shared memory
    tmp[threadIdx.x] = input[threadIdx.x + blockIdx.x * blockDim.x];
    __syncthreads();

    // Perform reduction in shared memory
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (threadIdx.x < s) {
            tmp[threadIdx.x] += tmp[threadIdx.x + s];
        }
        __syncthreads();
    }

    // Write result for this block to global memory
    if (threadIdx.x == 0) {
        output[blockIdx.x] = tmp[0];
    }
}