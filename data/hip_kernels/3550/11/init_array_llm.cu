#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void init_array(int *g_data, int *factor, int num_iterations)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int local_factor = *factor; // Load factor into register to reduce global memory access

    for (int i = 0; i < num_iterations; i++)
    {
        g_data[idx] += local_factor; // Use local register for repeated access
    }
}