#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Compute_weightx_weighty2_normother_Kernel(float* weightx, float* weighty, const float* absIx, const float* absIy, int nPixels, float norm_for_smooth_term, float eps)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;

    // Use conditional operator to reduce branching
    if (x < nPixels) {
        float pow_factor = 2.0f - norm_for_smooth_term;
        float absIx_val = absIx[x];
        float absIy_val = absIy[x];

        // Precomputing common expression
        float common_expr_x = powf(absIx_val, pow_factor) + eps;
        float common_expr_y = powf(absIy_val, pow_factor) + eps;

        weightx[x] = 1.0f / common_expr_x;
        weighty[x] = 1.0f / common_expr_y;
    }
}