```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void normalize_delta_kernel(int N, float *x, float *mean, float *variance, float *mean_delta, float *variance_delta, int batch, int filters, int spatial, float *delta)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index < N) {
        int f = (index / spatial) % filters;

        // Precompute common expressions to reduce redundant calculations
        float variance_sqrt_inv = 1.F / (sqrtf(variance[f]) + 0.000001f);
        float spatial_batch_factor = 1.0f / (spatial * batch);
        float x_mean_diff = x[index] - mean[f];

        delta[index] = delta[index] * variance_sqrt_inv + 
                       variance_delta[f] * 2.0f * x_mean_diff * spatial_batch_factor + 
                       mean_delta[f] * spatial_batch_factor;
    }
}