#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update3(float *rho_out, float *H0_out, const float *yDotS, const float *yDotY)
{
    // Load yDotS and yDotY into registers to reduce global memory access
    float yDotS_val = *yDotS;
    float yDotY_val = *yDotY;
    
    // Calculate rho_out
    *rho_out = 1.0f / yDotS_val;
    
    // Conditional calculation of H0_out
    if (yDotY_val > 1e-5)
    {
        *H0_out = yDotS_val / yDotY_val;
    }
}