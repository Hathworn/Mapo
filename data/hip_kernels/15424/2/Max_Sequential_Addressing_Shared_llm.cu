#include "hip/hip_runtime.h"
#include "includes.h"

#define MAX_CUDA_THREADS_PER_BLOCK 1024

__global__ void Max_Sequential_Addressing_Shared(float* data, int data_size) {
    int idx = blockDim.x * blockIdx.x + threadIdx.x;
    __shared__ float sdata[MAX_CUDA_THREADS_PER_BLOCK];

    // Load data into shared memory and ensure within bounds
    if (idx < data_size) {
        sdata[threadIdx.x] = data[idx];
    } else {
        sdata[threadIdx.x] = -FLT_MAX; // Use negative max for unused threads
    }
    __syncthreads();

    // Perform reduction using shared memory
    for (int stride = blockDim.x / 2; stride > 0; stride /= 2) {
        if (threadIdx.x < stride) {
            float lhs = sdata[threadIdx.x];
            float rhs = sdata[threadIdx.x + stride];
            sdata[threadIdx.x] = lhs < rhs ? rhs : lhs; // Store max
        }
        __syncthreads();
    }

    // Write the result back to the first position of data
    if (threadIdx.x == 0) {
        data[blockIdx.x] = sdata[0]; // Store final block max
    }
}