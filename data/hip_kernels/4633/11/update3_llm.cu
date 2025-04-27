#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update3(float *rho_out, float *H0_out, const float *yDotS, const float *yDotY)
{
    // Use local variables to prevent repeated dereferencing
    float yDotS_value = *yDotS;
    float yDotY_value = *yDotY;

    // Perform division in one access
    *rho_out = 1.0f / yDotS_value;

    // Conditional check with local variable
    if (yDotY_value > 1e-5)
        *H0_out = yDotS_value / yDotY_value;
}