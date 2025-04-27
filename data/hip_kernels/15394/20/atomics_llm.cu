#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void atomics(int *shared_var, int *values_read, int N, int iters)
{
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    if (tid >= N) return;

    // Combine the two atomicAdds to reduce contention and improve performance
    int local_increment = iters + 1;

    // First atomic add captures the initial read value
    values_read[tid] = atomicAdd(shared_var, local_increment) + iters;
}