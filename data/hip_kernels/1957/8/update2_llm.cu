#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update2(float *alphaMinusBeta_out, const float *rho, const float *yDotZ, const float *alpha)
{
    // Cache *rho, *yDotZ, *alpha in registers for faster access
    float rho_val = *rho;
    float yDotZ_val = *yDotZ;
    float alpha_val = *alpha;
    
    // Reuse cached values to compute beta
    const float beta = rho_val * yDotZ_val;
    
    // Store the result in the output
    *alphaMinusBeta_out = alpha_val - beta;
}