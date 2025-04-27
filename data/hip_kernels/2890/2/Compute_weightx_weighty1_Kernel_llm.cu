#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Compute_weightx_weighty1_Kernel(float* weightx, float* weighty, const float* psi, const float* phi, const float* absIx, const float* absIy, int nPixels, float norm_for_smooth_term, float eps)
{
    // Calculate the unique thread index
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    if (x >= nPixels) return;  // Terminate the thread if out of bounds

    float absIx_val = absIx[x];
    float absIy_val = absIy[x];
    float psi_val = psi[x];
    float phi_val = phi[x];

    // Precompute values based on norm_for_smooth_term
    if (norm_for_smooth_term == 2) {
        weightx[x] = psi_val;
        weighty[x] = phi_val;
    } else {
        float denom_x, denom_y;
        if (norm_for_smooth_term == 1) {  // L1 norm
            denom_x = absIx_val + eps;
            denom_y = absIy_val + eps;
        } else if (norm_for_smooth_term == 0) {  // Arbitrary small norm
            denom_x = absIx_val * absIx_val + eps;
            denom_y = absIy_val * absIy_val + eps;
        } else {  // General case
            float power = 2.0f - norm_for_smooth_term;
            denom_x = pow(absIx_val, power) + eps;
            denom_y = pow(absIy_val, power) + eps;
        }

        // Update weights
        weightx[x] = psi_val / denom_x;
        weighty[x] = phi_val / denom_y;
    }
}