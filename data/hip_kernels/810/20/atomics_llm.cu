#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void atomics(int *shared_var, int *values_read, int N, int iters)
{
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    if (tid >= N) return;

    // Use atomicAdd once to read the value and increment
    values_read[tid] = atomicAdd(shared_var, iters + 1) + 1;
}