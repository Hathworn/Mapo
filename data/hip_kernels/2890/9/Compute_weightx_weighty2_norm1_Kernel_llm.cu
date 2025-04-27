#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Compute_weightx_weighty2_norm1_Kernel(float* weightx, float* weighty, const float* absIx, const float* absIy, int nPixels, float norm_for_smooth_term, float eps)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    if (x < nPixels){
        // Use reciprocal to optimize division
        float inv_eps_x = 1.0f / (absIx[x] + eps);
        float inv_eps_y = 1.0f / (absIy[x] + eps);
        weightx[x] = inv_eps_x;
        weighty[x] = inv_eps_y;
    }
}