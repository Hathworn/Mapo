#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void constant_mul_kernel(const float *data_l, float constant, float *result, int total) 
{
    // Calculate unique thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Update loop condition to avoid unnecessary calculation
    if (idx < (total / 2)) {
        int data_idx = 2 * idx;
        
        // Perform vectorized operation for consecutive elements
        result[data_idx] = data_l[data_idx] * constant;
        result[data_idx + 1] = data_l[data_idx + 1] * constant;
    }
}