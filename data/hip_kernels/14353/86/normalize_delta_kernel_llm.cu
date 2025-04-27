#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_delta_kernel(int N, float *x, float *mean, float *variance, float *mean_delta, float *variance_delta, int batch, int filters, int spatial, float *delta)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index >= N) return;

    int f = (index / spatial) % filters;

    // Pre-compute reusable values
    float variance_sqrt_inv = rsqrtf(variance[f] + .00001f);
    float scale = variance_delta[f] * 2.0f / (spatial * batch);

    // Update delta
    delta[index] = delta[index] * variance_sqrt_inv + scale * (x[index] - mean[f]) + mean_delta[f] / (spatial * batch);
}