#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void constant_mul_kernel(const float *data_l, float constant, float *result, int total)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Process two elements per thread if within bounds, avoid unnecessary division
    int offset = idx * 2;
    if (offset < total * 2) {
        result[offset] = data_l[offset] * constant;
        result[offset + 1] = data_l[offset + 1] * constant;
    }
}