#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addMatrixSharedDynamic(int *a, int *b, int *res, int n)
{
    // Calculate global thread index
    int tidx = blockDim.x * blockIdx.x + threadIdx.x;
    int tidy = blockDim.y * blockIdx.y + threadIdx.y;

    // Return if thread is out of matrix bounds
    if (tidx >= n || tidy >= n) 
    {
        return;
    }

    // Calculate linear index
    int tid = tidx * n + tidy;
    
    extern __shared__ int arrays[];

    // Assign shared memory pointers
    int *s_a = arrays;
    int *s_b = &arrays[n * n];
    int *s_res = &s_b[n * n];

    // Load data into shared memory
    s_a[tid] = a[tid];
    s_b[tid] = b[tid];
    __syncthreads(); // Ensure all loads completed

    // Perform computation
    s_res[tid] = s_a[tid] + s_b[tid];
    __syncthreads(); // Ensure all computations completed

    // Write result back to global memory
    res[tid] = s_res[tid];
}