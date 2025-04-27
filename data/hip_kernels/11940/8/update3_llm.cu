#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update3(float *rho_out, float *H0_out, const float *yDotS, const float *yDotY)
{
    // Read values into registers to reduce global memory accesses
    float yDotS_val = *yDotS;
    float yDotY_val = *yDotY;

    // Compute rho_out using the value stored in the register
    *rho_out = 1.0f / yDotS_val;

    // Check the condition and compute H0_out only when necessary
    if (yDotY_val > 1e-5)
    {
        *H0_out = yDotS_val / yDotY_val;
    }
}