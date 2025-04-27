#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void vecAdd(int *a, int *b, int *c) {
    // Use shared memory to optimize memory access patterns
    __shared__ int tempA[blockDim.x];
    __shared__ int tempB[blockDim.x];

    int tid = threadIdx.x + blockIdx.x * blockDim.x;

    while (tid < D) {
        // Load data into shared memory
        tempA[threadIdx.x] = a[tid];
        tempB[threadIdx.x] = b[tid];

        __syncthreads(); // Ensure all loads are complete before proceeding

        // Perform vector addition
        c[tid] = tempA[threadIdx.x] + tempB[threadIdx.x];
        
        tid += blockDim.x * gridDim.x;
    }
}