#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update2(float *alphaMinusBeta_out, const float *rho, const float *yDotZ, const float *alpha)
{
    // Load inputs from global memory to local variables for quick access
    float rho_val = *rho;
    float yDotZ_val = *yDotZ;
    float alpha_val = *alpha;

    // Compute beta using local variables
    float beta = rho_val * yDotZ_val;

    // Perform subtraction and store the result
    *alphaMinusBeta_out = alpha_val - beta;
}