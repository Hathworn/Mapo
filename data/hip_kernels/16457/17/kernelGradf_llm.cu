#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelGradf(const float *d_x, float *d_grad)
{
    // Utilize registers for intermediate computation
    float x0 = d_x[0];
    float x1 = d_x[1];
    float x0_squared = x0 * x0;
    float common_term = x1 - x0_squared;

    // Optimize calculations by reusing computed values
    d_grad[0] = -2.0f * (1.0f - x0) - 400.0f * x0 * common_term;
    d_grad[1] = 200.0f * common_term;
}