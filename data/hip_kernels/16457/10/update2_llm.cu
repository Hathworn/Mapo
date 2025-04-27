#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update2(float *alphaMinusBeta_out, const float *rho, const float *yDotZ, const float *alpha)
{
    // Avoid repeated memory access by using local variables
    float local_rho = *rho;
    float local_yDotZ = *yDotZ;
    float local_alpha = *alpha;
    float beta = local_rho * local_yDotZ;
    *alphaMinusBeta_out = local_alpha - beta;
}