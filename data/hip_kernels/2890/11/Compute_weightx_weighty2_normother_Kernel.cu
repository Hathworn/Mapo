#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Compute_weightx_weighty2_normother_Kernel(float* weightx, float* weighty, const float* absIx, const float* absIy, int nPixels, float norm_for_smooth_term, float eps)
{
int bx = blockIdx.x;
int tx = threadIdx.x;

int x = bx*blockDim.x + tx;
if (x >= nPixels)
return;

weightx[x] = 1.0f / (pow(absIx[x], 2.0f - norm_for_smooth_term) + eps);
weighty[x] = 1.0f / (pow(absIy[x], 2.0f - norm_for_smooth_term) + eps);
}