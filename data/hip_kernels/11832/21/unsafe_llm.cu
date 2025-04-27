```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void unsafe(int *shared_var, int *values_read, int N, int iters)
{
    int i;
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    if (tid >= N) return;

    // Use atomicAdd to safely update shared_var in a concurrent environment
    int old = atomicAdd(shared_var, 1);
    values_read[tid] = old;

    // Loop with atomicAdd to ensure thread-safe updates to shared_var
    for (i = 0; i < iters; i++)
    {
        atomicAdd(shared_var, 1);
    }
}