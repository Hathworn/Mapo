#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float rsqrtf_eps(float x) {
    return rsqrtf(x + .000001f); // Add small epsilon to avoid division by zero
}

__global__ void normalize_delta_kernel(int N, float *x, float *mean, float *variance, float *mean_delta, float *variance_delta, int batch, int filters, int spatial, float *delta)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index >= N) return; // Check within bounds

    int f = (index / spatial) % filters;

    // Precompute frequently used terms
    float inv_sqrt_var = rsqrtf_eps(variance[f]);
    float scale = 1.0f / (spatial * batch);

    // Optimize memory access and compute delta
    float x_minus_mean = x[index] - mean[f];
    delta[index] = delta[index] * inv_sqrt_var + variance_delta[f] * 2.f * x_minus_mean * scale + mean_delta[f] * scale;
}