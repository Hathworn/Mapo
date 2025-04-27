#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduction(int* input, int* output) {
    __shared__ int tmp[TPB];

    int tid = threadIdx.x;
    int index = tid + blockIdx.x * blockDim.x;
    
    // Load data
    tmp[tid] = input[index];
    __syncthreads();

    // Reduce using a while loop to simplify logic
    for (int stride = blockDim.x / 2; stride > 0; stride /= 2) {
        if (tid < stride) {
            tmp[tid] += tmp[tid + stride];
        }
        __syncthreads();
    }

    // Write result
    if (tid == 0) {
        output[blockIdx.x] = tmp[0];
    }
}