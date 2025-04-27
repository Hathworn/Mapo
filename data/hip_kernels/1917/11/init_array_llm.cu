#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init_array(int *g_data, int *factor, int num_iterations)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Cache the factor value to reduce global memory access
    int local_factor = *factor;

    // Loop unrolling for improved performance
    for (int i = 0; i<num_iterations; i+=4) {
        g_data[idx] += local_factor;
        if (i+1 < num_iterations) g_data[idx] += local_factor;
        if (i+2 < num_iterations) g_data[idx] += local_factor;
        if (i+3 < num_iterations) g_data[idx] += local_factor;
    }
}