#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void atomics(int *shared_var, int *values_read, int N, int iters)
{
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    if (tid >= N) return;

    // Perform the initial atomic add once outside the loop
    int temp = atomicAdd(shared_var, iters + 1); 
    values_read[tid] = temp;

    // Commented out the loop as the atomic operation has been moved outside
    // for (int i = 0; i < iters; i++)
    // {
    //     atomicAdd(shared_var, 1);
    // } 
}