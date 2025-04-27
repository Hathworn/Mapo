#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Compute_weightx_weighty1_norm0_Kernel(float* weightx, float* weighty, const float* psi, const float* phi, const float* absIx, const float* absIy, int nPixels, float norm_for_smooth_term, float eps)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure thread is within bounds
    if (x < nPixels) {
        float absIx_eps = absIx[x] * absIx[x] + eps; // Precompute commonly used expression
        float absIy_eps = absIy[x] * absIy[x] + eps; // Precompute commonly used expression

        weightx[x] = psi[x] / absIx_eps;
        weighty[x] = phi[x] / absIy_eps;
    }
}