#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_delta_kernel(int N, float *x, float *mean, float *variance, float *mean_delta, float *variance_delta, int batch, int filters, int spatial, float *delta)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the index is within bounds
    if (index < N) {
        int f = (index / spatial) % filters;

        // Precompute repeated values for optimization
        float inv_sqrt_var = 1.f / sqrtf(variance[f] + .00001f);
        float factor = 2.f / (spatial * batch);
        
        // Update delta using precomputed values
        delta[index] = delta[index] * inv_sqrt_var + variance_delta[f] * factor * (x[index] - mean[f]) + mean_delta[f] / (spatial * batch);
    }
}