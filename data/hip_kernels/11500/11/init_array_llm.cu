#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init_array(int *g_data, int *factor, int num_iterations)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    int local_factor = *factor; // Cache factor in a register
    int local_value = g_data[idx]; // Load value to a register for reuse

    for (int i = 0; i < num_iterations; i++)
    {
        local_value += local_factor; // Use register values in the loop
    }

    g_data[idx] = local_value; // Write the result back to global memory once
}