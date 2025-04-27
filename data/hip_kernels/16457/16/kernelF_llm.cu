#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelF(const float *d_x, float *d_y)
{
    // Load first two elements from global memory and store in registers
    float x0 = d_x[0];
    float x1 = d_x[1];

    // Precompute common subexpressions
    float x0_square = x0 * x0;
    float a = (1.0f - x0);
    float b = (x1 - x0_square);

    // Compute result and store in output
    *d_y = (a * a) + 100.0f * (b * b);
}