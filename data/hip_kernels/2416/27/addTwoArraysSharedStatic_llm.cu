#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void addTwoArraysSharedStatic(int *v1, int *v2, int *r, int n)
{
    int tid = blockDim.x * blockIdx.x + threadIdx.x;

    if (tid >= n) return;

    // Use multiple shared memory buffers
    extern __shared__ int s[];

    int *s_v1 = s;
    int *s_v2 = s + blockDim.x;
    
    // Load data into shared memory from global memory
    s_v1[threadIdx.x] = v1[tid];
    s_v2[threadIdx.x] = v2[tid];
    
    __syncthreads(); // Ensure all data is loaded

    // Compute and store result in global memory
    r[tid] = s_v1[threadIdx.x] + s_v2[threadIdx.x];
}