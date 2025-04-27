#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void atomics(int *shared_var, int *values_read, int N, int iters)
{
    // Use register to minimize global memory access
    int i, local_var;
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    if (tid >= N) return;

    // Read shared_var once, avoid serializing atomicAdd operation
    local_var = atomicAdd(shared_var, 1);
    values_read[tid] = local_var;

    // Loop unrolling to reduce loop overhead
    for (i = 0; i < iters; i += 4)
    {
        if (i + 0 < iters) atomicAdd(shared_var, 1);
        if (i + 1 < iters) atomicAdd(shared_var, 1);
        if (i + 2 < iters) atomicAdd(shared_var, 1);
        if (i + 3 < iters) atomicAdd(shared_var, 1);
    }
}