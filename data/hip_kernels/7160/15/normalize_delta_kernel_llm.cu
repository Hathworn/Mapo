#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_delta_kernel(int N, float *x, float *mean, float *variance, float *mean_delta, float *variance_delta, int batch, int filters, int spatial, float *delta)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;  // Simplified index calculation
    if (index >= N) return;

    int f = (index / spatial) % filters;

    // Precomputed values for efficiency
    float variance_f = variance[f] + .00001f;
    float inv_sqrt_var = 1.f / sqrtf(variance_f);
    float spatial_batch = spatial * batch;
    float factor = 2.f / spatial_batch;
    
    // Update delta with optimized computation
    delta[index] = delta[index] * inv_sqrt_var +
                   variance_delta[f] * factor * (x[index] - mean[f]) +
                   mean_delta[f] / spatial_batch;
}