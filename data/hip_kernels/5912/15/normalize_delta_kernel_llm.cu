#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_delta_kernel(int N, float *x, float *mean, float *variance, float *mean_delta, float *variance_delta, int batch, int filters, int spatial, float *delta)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x; // Updated to use 1D grid for better efficiency
    if (index >= N) return;

    int f = (index / spatial) % filters;

    // Pre-compute constant terms for reduced calculations
    float inv_std_dev = 1.f / sqrtf(variance[f] + .00001f);
    float spatial_batch_reciprocal = 1.f / (spatial * batch);
    float delta_value = delta[index];
    float x_value = x[index];
    
    delta[index] = delta_value * inv_std_dev
                 + variance_delta[f] * 2.f * (x_value - mean[f]) * spatial_batch_reciprocal
                 + mean_delta[f] * spatial_batch_reciprocal;
}