#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_delta_kernel(int N, float *x, float *mean, float *variance, float *mean_delta, float *variance_delta, int batch, int filters, int spatial, float *delta)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if index is within bounds.
    if (index < N) {
        int f = (index / spatial) % filters;

        // Pre-compute values that are used multiple times.
        float inv_sqrt_var = rsqrtf(variance[f] + 0.00001f);
        float common_factor = 1.0f / (spatial * batch);

        // Optimize the delta update calculation
        delta[index] = delta[index] * inv_sqrt_var 
                      + variance_delta[f] * 2.0f * (x[index] - mean[f]) * common_factor 
                      + mean_delta[f] * common_factor;
    }
}