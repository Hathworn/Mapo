#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void callOperationSharedDynamic(int *a, int *b, int *res, int n)
{
    int tidx = blockDim.x * blockIdx.x + threadIdx.x;
    int tidy = blockDim.y * blockIdx.y + threadIdx.y;

    if (tidx >= n || tidy >= n)
    {
        return;
    }
    int tid = tidx * n + tidy;

    extern __shared__ int data[];

    int *s_a = data;
    int *s_b = &s_a[n * n]; // Corrected shared memory indexing
    int *s_res = &s_b[n * n];

    // Load input data to shared memory
    s_a[tid] = a[tid];
    s_b[tid] = b[tid];

    __syncthreads(); // Ensure all threads have written to shared memory

    // Perform operation
    s_res[tid] = s_a[tid] - s_b[tid];
    if (s_res[tid] < 0)
    {
        s_res[tid] = 0;
    }

    // Store result back to global memory
    res[tid] = s_res[tid];
}