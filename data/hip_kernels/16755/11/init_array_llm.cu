#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init_array(int *g_data, int *factor, int num_iterations)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Using shared memory to improve access efficiency
    __shared__ int shared_factor;
    if (threadIdx.x == 0)
    {
        shared_factor = *factor;
    }
    __syncthreads();

    for (int i = 0; i < num_iterations; i++)
    {
        g_data[idx] += shared_factor; // Optimized: using shared memory
    }
}