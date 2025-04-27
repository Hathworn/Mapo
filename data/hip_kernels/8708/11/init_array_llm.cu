#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init_array(int *g_data, int *factor, int num_iterations)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Optimize memory access by using local variable
    int local_factor = *factor;

    for (int i = 0; i < num_iterations; i++)
    {
        g_data[idx] += local_factor;
    }
}