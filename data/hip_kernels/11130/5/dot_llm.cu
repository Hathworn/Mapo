#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dot(int *a, int *b, int *c) {
    __shared__ int temp[THREADS_PER_BLOCK];
    int index = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Compute the partial dot product for each thread
    temp[threadIdx.x] = a[index] * b[index];
    __syncthreads();

    // Use efficient reduction within each block
    for (unsigned int stride = THREADS_PER_BLOCK / 2; stride > 0; stride >>= 1) {
        if (threadIdx.x < stride) {
            temp[threadIdx.x] += temp[threadIdx.x + stride];
        }
        __syncthreads();
    }

    // Sum results from all blocks using atomic operation
    if (threadIdx.x == 0) {
        atomicAdd(c, temp[0]);
    }
}