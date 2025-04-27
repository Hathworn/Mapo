#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel function
__global__ void update2(float *alphaMinusBeta_out, const float *rho, const float *yDotZ, const float *alpha)
{
    // Compute beta using shared variable to reduce global memory access
    float beta = (*rho) * (*yDotZ);
    
    // Compute result directly using loaded values
    *alphaMinusBeta_out = *alpha - beta;
}