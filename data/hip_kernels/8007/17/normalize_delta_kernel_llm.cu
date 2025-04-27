#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_delta_kernel(int N, float *x, float *mean, float *variance, float *mean_delta, float *variance_delta, int batch, int filters, int spatial, float *delta)
{
    int index = (blockIdx.x + blockIdx.y*gridDim.x) * blockDim.x + threadIdx.x;
    if (index >= N) return;
    int f = (index/spatial)%filters;

    // Precompute often used terms
    float inv_sqrt_variance = 1.f / sqrtf(variance[f] + .00001f);
    float two_variance_delta = 2.f * variance_delta[f] / (spatial * batch);
    float mean_delta_term = mean_delta[f] / (spatial * batch);
    float mean_diff = x[index] - mean[f];

    // Perform the delta normalization
    delta[index] = delta[index] * inv_sqrt_variance + two_variance_delta * mean_diff + mean_delta_term;
}