```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void simple_reduction(int *shared_var, int *input_values, int N, int iters)
{
    __shared__ int local_mem[256];
    int iter;
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int local_tid = threadIdx.x;

    for (iter = 0; iter < iters; iter++)
    {
        if (tid < N)
        {
            local_mem[local_tid] = input_values[tid];
        }

        // Synchronize to make sure all threads have loaded their data
        __syncthreads();

        // Perform binary tree reduction
        for (int stride = 1; stride < blockDim.x; stride *= 2)
        {
            if (local_tid % (2 * stride) == 0 && (local_tid + stride < blockDim.x))
            {
                local_mem[local_tid] += local_mem[local_tid + stride];
            }

            // Synchronize after each reduction step to ensure all operations are complete
            __syncthreads();
        }

        // Final update to shared_var using atomic operation
        if (local_tid == 0)
        {
            atomicAdd(shared_var, local_mem[0]);
        }
    }
}