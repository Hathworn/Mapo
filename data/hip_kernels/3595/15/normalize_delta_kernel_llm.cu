#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_delta_kernel(int N, float *x, float *mean, float *variance, float *mean_delta, float *variance_delta, int batch, int filters, int spatial, float *delta)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index >= N) return;
    
    // Calculate filter index
    int f = (index / spatial) % filters;
    
    // Precompute constants for use in the main computation
    float inv_sqrt_var = 1.f / sqrtf(variance[f] + .00001f);
    float two_var_delta = variance_delta[f] * 2.f / (spatial * batch);
    float mean_delta_scaled = mean_delta[f] / (spatial * batch);
    
    // Apply the normalization and update delta
    delta[index] = delta[index] * inv_sqrt_var + two_var_delta * (x[index] - mean[f]) + mean_delta_scaled;
}