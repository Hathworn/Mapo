#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelF(const float *d_x, float *d_y)
{
    // Use registers for a and b to optimize memory access
    const float x0 = d_x[0];
    const float x1 = d_x[1];
    float a = 1.0f - x0;
    float b = x1 - x0 * x0;

    // Store final value directly to d_y
    *d_y = a * a + 100.0f * b * b;
}