#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_delta_kernel(int N, float *x, float *mean, float *variance, float *mean_delta, float *variance_delta, int batch, int filters, int spatial, float *delta)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x; // Simplify 1D grid calculation
    if (index >= N) return;

    int f = (index / spatial) % filters;
    float inv_sqrt_var = rsqrtf(variance[f] + .000001f); // Use faster rsqrtf for reciprocal square root
    float x_minus_mean = x[index] - mean[f];

    float var_delta_term = variance_delta[f] * 2.0f * x_minus_mean / (spatial * batch);
    float mean_delta_term = mean_delta[f] / (spatial * batch);

    delta[index] = delta[index] * inv_sqrt_var + var_delta_term + mean_delta_term;
}