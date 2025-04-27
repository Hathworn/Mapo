#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_delta_kernel(int N, float *x, float *mean, float *variance, float *mean_delta, float *variance_delta, int batch, int filters, int spatial, float *delta)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation
    if (index >= N) return;
    int f = (index / spatial) % filters;

    float inv_sqrt_var = rsqrtf(variance[f] + 1e-6f); // Precompute inverse sqrt
    float factor = 2.f / (spatial * batch);
    
    // Combine multiplications and store intermediary results
    float delta_factor = delta[index] * inv_sqrt_var;
    float variance_contrib = variance_delta[f] * factor * (x[index] - mean[f]);
    float mean_contrib = mean_delta[f] * factor;

    delta[index] = delta_factor + variance_contrib + mean_contrib;
}