#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Compute_weightx_weighty1_norm1_Kernel(float* weightx, float* weighty, const float* psi, const float* phi, const float* absIx, const float* absIy, int nPixels, float norm_for_smooth_term, float eps)
{
    // Use threadIdx.x for indexing potential shared resources
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Early return if index out of bounds
    if (x >= nPixels)
        return;
    
    // Compute weightx and weighty using texture memory for constant memory access
    float absIx_val = absIx[x];
    float absIy_val = absIy[x];
    weightx[x] = psi[x] / (absIx_val + eps);
    weighty[x] = phi[x] / (absIy_val + eps);
}