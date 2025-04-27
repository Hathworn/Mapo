#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void callOperationSharedDynamic(int *a, int *b, int *c, int n)
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
    int *s_b = &s_a[n * n]; // Use 'n' instead of 'size' for clarity
    int *s_c = &s_b[n * n];

    // Load input data into shared memory
    s_a[tid] = a[tid];
    s_b[tid] = b[tid];

    __syncthreads(); // Ensure all threads have loaded data

    // Perform operation and store the result
    if (s_a[tid] >= s_b[tid])
    {
        s_c[tid] = s_a[tid];
    }
    else
    {
        s_c[tid] = s_b[tid];
    }

    __syncthreads(); // Ensure all calculations are done

    // Store result back to global memory
    c[tid] = s_c[tid];
}