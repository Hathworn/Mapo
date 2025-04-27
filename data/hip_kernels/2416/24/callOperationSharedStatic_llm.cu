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

    // Use a smaller, statically defined shared memory size to optimize resource usage
    __shared__ int s_a[256], s_b[256], s_c[256];

    // Calculate local index for shared memory
    int local_tid = threadIdx.x + blockDim.x * threadIdx.y;

    // Load data into shared memory
    s_a[local_tid] = a[tid];
    s_b[local_tid] = b[tid];
    __syncthreads(); // Ensure all threads have loaded their data

    // Perform operation using shared memory
    s_c[local_tid] = max(s_a[local_tid], s_b[local_tid]);
    __syncthreads(); // Ensure completion of computation

    // Write result back to global memory
    c[tid] = s_c[local_tid];
}