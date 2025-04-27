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
    int *s_b = &s_a[n * n];  // Use the dynamic shared memory size
    int *s_c = &s_b[n * n];  // Adjust shared memory index

    // Copy to shared memory
    s_a[tid] = a[tid];
    s_b[tid] = b[tid];
    __syncthreads();  // Ensure all threads have loaded data into shared memory

    // Perform operation
    s_c[tid] = min(s_a[tid], s_b[tid]);

    // Write results to global memory
    c[tid] = s_c[tid];
}