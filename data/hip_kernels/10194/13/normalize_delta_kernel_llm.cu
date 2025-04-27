```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_delta_kernel(int N, float *x, float *mean, float *variance, float *mean_delta, float *variance_delta, int batch, int filters, int spatial, float *delta)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;  // Simplified index calculation for 1D grid
    if (index >= N) return;
    
    int f = (index / spatial) % filters;

    // Cache reused terms for optimization
    float cached_variance = sqrt(variance[f]) + 0.000001f;
    float cached_spatial_batch = spatial * batch;
    float delta_val = delta[index];
    float mean_f = mean[f];
    float x_val = x[index];
    
    delta[index] = delta_val / cached_variance 
                  + variance_delta[f] * 2.0f * (x_val - mean_f) / cached_spatial_batch
                  + mean_delta[f] / cached_spatial_batch;
}