#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void callOperation(int *a, int *result, int k, int n)
{
    // Calculate thread id in a 1D grid
    int tidx = blockDim.x * blockIdx.x + threadIdx.x;
    int tidy = blockDim.y * blockIdx.y + threadIdx.y;
  
    // Flattened 1D grid index computation
    int tid = tidx * n + tidy;

    // Exit early if out of bounds
    if (tidx >= n || tidy >= n)
    {
        return;
    }

    // Use atomic operation to safely accumulate result
    if (a[tid] == k)
    {
        atomicAdd(result, 1);
    }
}