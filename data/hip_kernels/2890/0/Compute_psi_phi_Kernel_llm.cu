#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Compute_psi_phi_Kernel(float* psi, float* phi, const float* gAbsIx, const float* gAbsIy, const float* gIx, const float* gIy, int nPixels, float norm_for_contrast_num, float norm_for_contrast_denom, float eps)
{
    // Calculate unique thread index
    int x = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if index is within the bounds
    if (x >= nPixels)
        return;

    float psi_num, psi_denom;
    float phi_num, phi_denom;

    // Use ternary operators for efficient calculations
    psi_num = (norm_for_contrast_num == 0) ? 1 :
              (norm_for_contrast_num == 1) ? gAbsIx[x] :
              (norm_for_contrast_num == 2) ? gAbsIx[x] * gAbsIx[x] :
              powf(gAbsIx[x], norm_for_contrast_num);

    phi_num = (norm_for_contrast_num == 0) ? 1 :
              (norm_for_contrast_num == 1) ? gAbsIy[x] :
              (norm_for_contrast_num == 2) ? gAbsIy[x] * gAbsIy[x] :
              powf(gAbsIy[x], norm_for_contrast_num);

    psi_denom = (norm_for_contrast_denom == 0) ? 1 :
                (norm_for_contrast_denom == 1) ? fabsf(gIx[x]) + eps :
                (norm_for_contrast_denom == 2) ? gIx[x] * gIx[x] + eps :
                powf(fabsf(gIx[x]), norm_for_contrast_denom) + eps;

    phi_denom = (norm_for_contrast_denom == 0) ? 1 :
                (norm_for_contrast_denom == 1) ? fabsf(gIy[x]) + eps :
                (norm_for_contrast_denom == 2) ? gIy[x] * gIy[x] + eps :
                powf(fabsf(gIy[x]), norm_for_contrast_denom) + eps;

    // Compute psi and phi
    psi[x] = psi_num / psi_denom;
    phi[x] = phi_num / phi_denom;
}