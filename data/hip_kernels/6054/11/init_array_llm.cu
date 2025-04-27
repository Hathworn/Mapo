#include "hip/hip_runtime.h"
#include "includes.h"

// Utilize registers and shared memory to improve performance
__global__ void init_array(int *g_data, int *factor, int num_iterations)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int local_factor = *factor;  // Use register to store factor

    // Unrolling loop to minimize loop overhead
    for (int i = 0; i < num_iterations; i += 4) {
        g_data[idx] += local_factor;
        g_data[idx] += local_factor;
        g_data[idx] += local_factor;
        g_data[idx] += local_factor;
    }

    // Handle remaining iterations for non-multiples of 4
    for (int i = num_iterations & ~3; i < num_iterations; ++i) {
        g_data[idx] += local_factor;
    }
}