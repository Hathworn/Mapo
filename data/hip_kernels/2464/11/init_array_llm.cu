#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init_array(int *g_data, int *factor, int num_iterations)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use register for temporary storage to optimize access time
    int local_factor = *factor;
    
    // Unroll loops for improved performance
    for (int i = 0; i < num_iterations; i += 4)
    {
        g_data[idx] += local_factor;
        g_data[idx] += local_factor;
        g_data[idx] += local_factor;
        g_data[idx] += local_factor;
    }
}