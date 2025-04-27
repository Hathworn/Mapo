#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void constant_add_kernel(const float *data_l, float constant, float *result, int total)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Access two elements per thread efficiently
    int base_idx = 2 * idx;

    if (idx < total) { // Use idx directly for proper boundary check
        result[base_idx] = data_l[base_idx] + constant;
        result[base_idx + 1] = data_l[base_idx + 1];
    }
}