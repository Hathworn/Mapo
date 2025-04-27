#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuMult(int n, float *a, float *b, float *result)
{
    // Use shared memory to improve memory access efficiency
    __shared__ float a_shared[256];
    __shared__ float b_shared[256];

    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Only load data within bounds
    if (i < n)
    {
        a_shared[threadIdx.x] = a[i];
        b_shared[threadIdx.x] = b[i];
        __syncthreads();

        result[i] = a_shared[threadIdx.x] * b_shared[threadIdx.x];
    }
}