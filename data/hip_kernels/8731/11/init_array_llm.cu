#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init_array(int *g_data, int *factor, int num_iterations)
{
    // Cache factor value in shared memory for faster access
    __shared__ int cached_factor;
    if (threadIdx.x == 0) {
        cached_factor = *factor;
    }
    __syncthreads();

    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use local variable for g_data update to avoid redundant memory access
    int local_value = g_data[idx];
    for (int i = 0; i < num_iterations; i++)
        local_value += cached_factor;
    g_data[idx] = local_value; // Write result back to global memory
}