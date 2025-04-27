#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void atomics(int *shared_var, int *values_read, int N, int iters)
{
    // Calculate the unique thread ID.
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Exit if the thread ID is out of bounds.
    if (tid >= N) return;

    // Use atomicAdd to increment shared_var and store the original value in values_read.
    values_read[tid] = atomicAdd(shared_var, iters + 1);

    // Use atomicAdd directly within the same call to accumulate iters in shared_var.
    // Unrolling this operation as part of the single atomicAdd call above for optimization.
}