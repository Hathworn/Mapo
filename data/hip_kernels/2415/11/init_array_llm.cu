```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init_array(int *g_data, int *factor, int num_iterations)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int local_factor = *factor; // Cache factor in a shared register

    // Unroll loop for better performance
    #pragma unroll
    for (int i = 0; i < num_iterations; i++)
    {
        g_data[idx] += local_factor;
    }
}