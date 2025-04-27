#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Compute_weightx_weighty2_Kernel(float* weightx, float* weighty, const float* absIx, const float* absIy, int nPixels, float norm_for_smooth_term, float eps)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    if (x >= nPixels) return;

    // Use conditional operator to simplify code
    float inv_eps = 1.0f / eps;
    float inv_norm = 1.0f / (2.0f - norm_for_smooth_term);

    if (norm_for_smooth_term == 2) {
        weightx[x] = 1.0f;
        weighty[x] = 1.0f;
    }
    else {
        float ix_val = absIx[x];
        float iy_val = absIy[x];
        if (norm_for_smooth_term == 1) {
            weightx[x] = 1.0f / (ix_val + eps);
            weighty[x] = 1.0f / (iy_val + eps);
        }
        else if (norm_for_smooth_term == 0) {
            weightx[x] = 1.0f / (ix_val * ix_val + eps);
            weighty[x] = 1.0f / (iy_val * iy_val + eps);
        }
        else {
            weightx[x] = pow(ix_val, inv_norm) * inv_eps;
            weighty[x] = pow(iy_val, inv_norm) * inv_eps;
        }
    }
}