#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void simple_reduction(int *shared_var, int *input_values, int N, int iters)
{
    __shared__ int local_mem[256];
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int local_tid = threadIdx.x;

    // Calculate the number of valid threads in this block
    int local_dim = blockDim.x;
    int minThreadInThisBlock = blockIdx.x * blockDim.x;
    int maxThreadInThisBlock = minThreadInThisBlock + (blockDim.x - 1);
    if (maxThreadInThisBlock >= N) {
        local_dim = N - minThreadInThisBlock;
    }

    for (int iter = 0; iter < iters; iter++)
    {
        if (tid < N)
        {
            local_mem[local_tid] = input_values[tid];
        }
        __syncthreads();  // Ensure all threads have written their data

        // Perform the local reduction using parallel reduction technique
        for (int s = local_dim / 2; s > 0; s >>= 1) {
            if (local_tid < s) {
                local_mem[local_tid] += local_mem[local_tid + s];
            }
            __syncthreads();
        }

        if (local_tid == 0)
        {
            atomicAdd(shared_var, local_mem[0]);
        }
        __syncthreads();  // Ensure shared_var update visibility
    }
}