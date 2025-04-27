#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpuSum(int *a, int *b, int *c, int n) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x;

    // Optimize memory access by using shared memory
    __shared__ int shared_a[256];
    __shared__ int shared_b[256];

    while (idx < n) {
        // Load data into shared memory
        shared_a[threadIdx.x] = a[idx];
        shared_b[threadIdx.x] = b[idx];
        __syncthreads();

        // Perform computation using shared memory
        c[idx] = shared_a[threadIdx.x] + shared_b[threadIdx.x];
        __syncthreads();

        idx += blockDim.x * gridDim.x;
    }
}