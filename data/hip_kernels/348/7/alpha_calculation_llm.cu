#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void alpha_calculation(float *r_squared, float *p_sum, float *alpha)
{
    // Use blockIdx.x to support distributed computation across blocks
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Check idx to ensure no out-of-bounds memory access
    if (idx == 0) {
        alpha[idx] = r_squared[idx] / p_sum[idx];
    }
}