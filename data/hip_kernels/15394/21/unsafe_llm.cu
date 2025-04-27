#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void unsafe(int *shared_var, int *values_read, int N, int iters)
{
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    if (tid >= N) return;

    // Load shared variable once
    int local_var = atomicAdd(shared_var, 1);
    values_read[tid] = local_var;

    // Use loop-specific increments in shared memory updates
    for (int i = 0; i < iters; i++)
    {
        atomicAdd(shared_var, 1);
    }
}