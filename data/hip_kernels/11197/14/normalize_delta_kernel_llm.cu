#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_delta_kernel(int N, float *x, float *mean, float *variance, float *mean_delta, float *variance_delta, int batch, int filters, int spatial, float *delta)
{
    // Optimized block and grid index computation
    int index = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;
    if (index >= N) return;

    int f = (index / spatial) % filters;
    float var_sqrt_inv = rsqrtf(variance[f] + 0.00001f); // Precompute inverse sqrt for normalization
    float scale = 1.0f / (spatial * batch);

    // Use precomputed values and simplified operations
    delta[index] = delta[index] * var_sqrt_inv 
                 + variance_delta[f] * 2.0f * (x[index] - mean[f]) * scale 
                 + mean_delta[f] * scale;
}