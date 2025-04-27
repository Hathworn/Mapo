#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_delta_kernel(int N, float *x, float *mean, float *variance, float *mean_delta, float *variance_delta, int batch, int filters, int spatial, float *delta)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Use loop to cover all elements, especially useful when N is large
    for (; index < N; index += stride) {
        int f = (index/spatial)%filters;
        float sqrt_variance = sqrt(variance[f]) + .000001f;
        float common_factor = 1.f / (spatial * batch);
        float x_mean_diff = x[index] - mean[f];

        // Optimize computation by pre-calculating common terms
        delta[index] = delta[index] / sqrt_variance 
                       + variance_delta[f] * 2.f * x_mean_diff * common_factor 
                       + mean_delta[f] * common_factor;
    }
}