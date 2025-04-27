#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void callOperationSharedDynamic(int *a, int *b, int *c, int n)
{
    int tid = blockDim.x * blockIdx.x + threadIdx.x;

    if (tid >= n) {
        return;
    }

    // Efficient shared memory usage with bank conflict avoidance
    extern __shared__ int data[];

    int *s_a = data;
    int *s_b = &s_a[blockDim.x];
    int *s_c = &s_b[blockDim.x];

    // Load data into shared memory
    s_a[threadIdx.x] = a[tid];
    s_b[threadIdx.x] = b[tid];

    __syncthreads(); // Ensure all data is loaded before proceeding

    // Perform computation using shared memory
    if (s_a[threadIdx.x] <= s_b[threadIdx.x])
    {
        s_c[threadIdx.x] = s_a[threadIdx.x];
    }
    else
    {
        s_c[threadIdx.x] = s_b[threadIdx.x];
    }

    __syncthreads(); // Ensure computation is completed

    // Store the result back to global memory
    c[tid] = s_c[threadIdx.x];
}