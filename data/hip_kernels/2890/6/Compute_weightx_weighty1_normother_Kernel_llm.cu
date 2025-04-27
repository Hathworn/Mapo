#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Compute_weightx_weighty1_normother_Kernel(float* weightx, float* weighty, const float* psi, const float* phi, const float* absIx, const float* absIy, int nPixels, float norm_for_smooth_term, float eps)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure x is within bounds to eliminate warp divergence
    if (x < nPixels) {
        float absIx_val = absIx[x];  // Load global memory elements to register
        float absIy_val = absIy[x];  // Load global memory elements to register
        weightx[x] = psi[x] / (pow(absIx_val, 2.0f - norm_for_smooth_term) + eps);
        weighty[x] = phi[x] / (pow(absIy_val, 2.0f - norm_for_smooth_term) + eps);
    }
}