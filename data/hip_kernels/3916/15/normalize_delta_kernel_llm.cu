#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_delta_kernel(int N, float *x, float *mean, float *variance, float *mean_delta, float *variance_delta, int batch, int filters, int spatial, float *delta) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure we do not access out-of-bounds memory
    if (index < N) {
        int f = (index / spatial) % filters;

        // Pre-compute frequently used values to reduce redundant calculations
        float inv_sqrt_variance = 1.f / sqrtf(variance[f] + 0.00001f);
        float spatial_batch_inv = 1.f / (spatial * batch);
        float two_variance_delta = 2.f * variance_delta[f];

        float x_mean_diff = x[index] - mean[f];

        // Simplify expression by aggregating similar calculations
        delta[index] = delta[index] * inv_sqrt_variance + 
                       two_variance_delta * x_mean_diff * spatial_batch_inv + 
                       mean_delta[f] * spatial_batch_inv;
    }
}