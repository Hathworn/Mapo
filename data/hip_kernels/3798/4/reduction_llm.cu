#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduction(int* input, int* output) {
    __shared__ int tmp[TPB];

    // Load input elements into shared memory
    int tid = threadIdx.x;
    int idx = tid + blockIdx.x * blockDim.x;
    tmp[tid] = input[idx];
    
    __syncthreads();

    // Perform reduction using a single loop
    for (int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            tmp[tid] += tmp[tid + s];
        }
        __syncthreads();
    }

    // Write the result from the first thread of each block
    if (tid == 0) {
        output[blockIdx.x] = tmp[0];
    }
}