#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduction(int* input, int* output) {
    __shared__ int tmp[TPB];

    // Load data into shared memory
    int tid = threadIdx.x;
    int index = tid + blockIdx.x * blockDim.x;
    tmp[tid] = input[index];

    __syncthreads();

    // Perform reduction in shared memory
    for (int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            tmp[tid] += tmp[tid + s];
        }
        __syncthreads();
    }

    // Write result for this block to output
    if (tid == 0) {
        output[blockIdx.x] = tmp[0];
    }
}