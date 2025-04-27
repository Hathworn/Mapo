#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update3(float *rho_out, float *H0_out, const float *yDotS, const float *yDotY)
{
    // Load yDotS and yDotY into registers for faster access
    float yDotS_val = *yDotS;
    float yDotY_val = *yDotY;

    // Update rho_out and H0_out with conditional check inside
    *rho_out = 1.0f / yDotS_val;
    if (yDotY_val > 1e-5)
    {
        *H0_out = yDotS_val / yDotY_val;
    }
}