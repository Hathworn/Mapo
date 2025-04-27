#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init_array(int *g_data, int *factor, int num_iterations)
{
    // Use shared memory for better performance
    __shared__ int shared_factor;
    if (threadIdx.x == 0) {
        shared_factor = *factor;
    }
    __syncthreads();

    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    for (int i = 0; i < num_iterations; i++) {
        g_data[idx] += shared_factor; // Use shared memory
    }
}