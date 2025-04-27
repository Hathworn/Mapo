#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _norm_backward_kernel(float *x, float *mean, float *var, float *mean_diff, float *var_diff, int b, int c, int wxh, float *grad)
{
    // Calculate index and check if within bounds
    int ind = blockIdx.x * blockDim.x + threadIdx.x + blockDim.x * gridDim.x * blockIdx.y;
    if (ind >= b * c * wxh) return;

    // Precompute repetitive values outside the core computation
    int j = (ind / wxh) % c;
    float inv_sqrt_var = rsqrtf(var[j] + 0.00001f);
    float b_wxh_inv = 1.0f / (wxh * b);
    float x_mean_diff = x[ind] - mean[j];

    // Perform computation using precomputed values
    grad[ind] = grad[ind] * inv_sqrt_var + var_diff[j] * 2.0f * x_mean_diff * b_wxh_inv + mean_diff[j] * b_wxh_inv;
}