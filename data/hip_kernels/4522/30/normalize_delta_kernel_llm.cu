#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_delta_kernel(int N, float *x, float *mean, float *variance, float *mean_delta, float *variance_delta, int batch, int filters, int spatial, float *delta)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x; // Flattened 1D index calculation
    if (index >= N) return;

    int f = (index / spatial) % filters;

    // Precompute common terms to optimize performance
    float inv_sqrt_variance = 1.f / sqrtf(variance[f] + .00001f);
    float variance_factor = variance_delta[f] * 2.f / (spatial * batch);
    float mean_factor = mean_delta[f] / (spatial * batch);

    // Combine all contributions to delta[index]
    delta[index] = delta[index] * inv_sqrt_variance + variance_factor * (x[index] - mean[f]) + mean_factor;
}