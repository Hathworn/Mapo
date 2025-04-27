#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void alpha_calculation(float * r_squared ,float * p_sum, float * alpha)
{
    // Using local variables to minimize memory access
    float r_sq = r_squared[0];
    float p_s = p_sum[0];
    alpha[0] = r_sq / p_s;
}