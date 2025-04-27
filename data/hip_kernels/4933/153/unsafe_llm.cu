#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void unsafe(int *shared_var, int *values_read, int N, int iters)
{
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    if (tid >= N) return;

    __shared__ int shared_buf;
    if (threadIdx.x == 0) {
        shared_buf = *shared_var; // Use shared memory for faster access during the loop
    }
    __syncthreads();

    values_read[tid] = atomicAdd(&shared_buf, 1); // Atomic operation to prevent race conditions

    for (int i = 0; i < iters; i++)
    {
        atomicAdd(&shared_buf, 1); // Atomic operation in the loop
    }

    if (threadIdx.x == 0) {
        atomicAdd(shared_var, shared_buf); // Write back to global memory from shared memory
    }
}