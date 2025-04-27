#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelF(const float *d_x, float *d_y)
{
    // Load input data into registers to optimize memory access
    float x0 = d_x[0];
    float x1 = d_x[1];

    // Perform calculations using registers
    float a = (1.0f - x0);
    float b = (x1 - x0 * x0);

    // Store the result
    *d_y = a * a + 100.0f * b * b;
}