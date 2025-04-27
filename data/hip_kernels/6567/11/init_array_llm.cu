#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init_array(int *g_data, int *factor, int num_iterations)
{
    // Cache factor value into a register to avoid repetitive global memory access
    int factor_value = *factor;
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    for (int i = 0; i<num_iterations; i++)
        g_data[idx] += factor_value; // Access factor from register instead of global memory
}