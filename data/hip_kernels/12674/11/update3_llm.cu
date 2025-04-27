#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update3(float *rho_out, float *H0_out, const float *yDotS, const float *yDotY)
{
    // Load data into registers to reduce global memory accesses
    float local_yDotS = *yDotS;
    float local_yDotY = *yDotY;

    // Compute and store *rho_out
    *rho_out = 1.0f / local_yDotS; 

    // Compute conditionally and store *H0_out
    if (local_yDotY > 1e-5)
    {
        *H0_out = local_yDotS / local_yDotY;
    }
}