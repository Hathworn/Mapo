#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void simple_reduction(int *shared_var, int *input_values, int N, int iters)
{
    __shared__ int local_mem[256];
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int local_tid = threadIdx.x;

    for (int iter = 0; iter < iters; iter++)
    {
        // Load input values into shared memory
        if (tid < N)
        {
            local_mem[local_tid] = input_values[tid];
        }
        else
        {
            local_mem[local_tid] = 0; // Ensure no garbage value
        }

        __syncthreads(); // Synchronize to ensure all values are loaded

        // Perform parallel reduction
        for (int stride = blockDim.x / 2; stride > 0; stride >>= 1)
        {
            if (local_tid < stride)
            {
                local_mem[local_tid] += local_mem[local_tid + stride];
            }
            __syncthreads(); // Ensure shared data consistency
        }

        // Write result from the block to global memory
        if (local_tid == 0)
        {
            atomicAdd(shared_var, local_mem[0]);
        }
        __syncthreads(); // Ensure completion before the next iteration
    }
}