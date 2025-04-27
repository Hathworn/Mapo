#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void simple_reduction(int *shared_var, int *input_values, int N, int iters)
{
    __shared__ int local_mem[256];
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int local_tid = threadIdx.x;

    // Directly use blockDim.x for local_dim calculation only when necessary
    int local_dim = (blockIdx.x * blockDim.x + blockDim.x > N) ? N - blockIdx.x * blockDim.x : blockDim.x;

    for (int iter = 0; iter < iters; iter++)
    {
        if (tid < N)
        {
            local_mem[local_tid] = input_values[tid];
        }

        __syncthreads(); // Ensure all threads have written to shared memory

        // Reduce in a tree-like manner for efficient parallel reduction
        for (int stride = 1; stride < local_dim; stride *= 2)
        {
            if (local_tid % (2 * stride) == 0 && local_tid + stride < local_dim)
            {
                local_mem[local_tid] += local_mem[local_tid + stride];
            }
            __syncthreads();
        }

        // Perform atomic add after reduction
        if (local_tid == 0)
        {
            atomicAdd(shared_var, local_mem[0]);
        }
        
        __syncthreads(); // Ensure correct completion of reduction before next iteration
    }
}