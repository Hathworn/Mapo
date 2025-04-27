#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init_array(int *g_data, int *factor, int num_iterations)
{
    // Calculate flattened global index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Cache factor value in shared memory to enhance performance
    __shared__ int cached_factor;
    if (threadIdx.x == 0) {
        cached_factor = *factor;
    }
    // Synchronize to ensure all threads have loaded the factor
    __syncthreads();
    
    // Perform iterations with cached factor
    int temp = 0;
    for (int i = 0; i < num_iterations; i++) {
        temp += cached_factor;
    }
    g_data[idx] += temp;
}