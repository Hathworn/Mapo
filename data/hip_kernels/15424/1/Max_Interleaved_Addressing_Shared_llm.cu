#include "hip/hip_runtime.h"
#include "includes.h"

#define MAX_CUDA_THREADS_PER_BLOCK 1024

__global__ void Max_Interleaved_Addressing_Shared(float* data, int data_size) {
    int idx = blockDim.x * blockIdx.x + threadIdx.x;
    __shared__ float sdata[MAX_CUDA_THREADS_PER_BLOCK];

    // Load data into shared memory
    if (idx < data_size) {
        sdata[threadIdx.x] = data[idx];
    } else {
        sdata[threadIdx.x] = -FLT_MAX; // Handle out-of-bound threads
    }
    __syncthreads();

    // Perform reduction within shared memory
    for (int stride = blockDim.x / 2; stride > 0; stride /= 2) {
        if (threadIdx.x < stride) {
            float lhs = sdata[threadIdx.x];
            float rhs = sdata[threadIdx.x + stride];
            sdata[threadIdx.x] = lhs < rhs ? rhs : lhs;
        }
        __syncthreads();
    }

    // Write result back to global memory
    if (threadIdx.x == 0) {
        data[blockIdx.x] = sdata[0];
    }
}