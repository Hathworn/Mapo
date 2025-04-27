#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void callOperationSharedStatic(int *a, int *b, int *c, int n)
{
    int tidx = blockDim.x * blockIdx.x + threadIdx.x;
    int tidy = blockDim.y * blockIdx.y + threadIdx.y;

    if (tidx >= n || tidy >= n)
    {
        return;
    }

    int tid = tidx * n + tidy;

    // Using static shared memory allocation.
    __shared__ int s_a[size];
    __shared__ int s_b[size];

    // Load data into shared memory using each thread.
    s_a[tid] = a[tid];
    s_b[tid] = b[tid];

    // Synchronize threads to ensure all data is loaded.
    __syncthreads();

    // Perform conditional operation directly on shared memory.
    int result = (s_a[tid] <= s_b[tid]) ? s_a[tid] : s_b[tid];

    // Write the result back to global memory.
    c[tid] = result;
}