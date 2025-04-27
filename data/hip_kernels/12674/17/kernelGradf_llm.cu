#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernelGradf(const float *d_x, float *d_grad)
{
    // Load inputs into registers to reduce global memory access
    const float x0 = d_x[0];
    const float x1 = d_x[1];
    
    // Precompute reused expression to reduce arithmetic operations
    const float x0_squared = x0 * x0;
    const float temp = x1 - x0_squared;

    // df/dx0 = -2 (1-x0) - 400 (x1-x0^2) x0
    // df/dx1 = 200 (x1 - x0^2)
    d_grad[0] = -2.0f * (1.0f - x0) - 400.0f * x0 * temp;
    d_grad[1] = 200.0f * temp;
}