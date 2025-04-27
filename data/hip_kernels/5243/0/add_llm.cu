```c
#include "hip/hip_runtime.h"
#include "includes.h"

// CUDA kernel to add elements

__global__ void add(int N, float *x)
{
    // Use shared memory for optimized performance
    __shared__ float sdata[blockDim.x];
    
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Load data into shared memory
    if (i < N) {
        sdata[threadIdx.x] = x[i] * 2;
    }
    
    __syncthreads();

    // Write back results to global memory
    if (i < N) {
        x[i] = sdata[threadIdx.x];
    }
}