#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void constant_add_kernel(const float *data_l, float constant, float *result, int total)
{
    // Calculate global thread index
    int tid = blockIdx.x * blockDim.x + threadIdx.x; 
    
    // Compute the effective input index
    int idx = 2 * tid;

    // Check if within limits and only access when necessary
    if (idx < 2 * total) {
        result[idx] = data_l[idx] + constant;
        result[idx + 1] = data_l[idx + 1];
    }
}