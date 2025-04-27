#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_delta_kernel(int N, float *x, float *mean, float *variance, float *mean_delta, float *variance_delta, int batch, int filters, int spatial, float *delta)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x; // Optimize index calculation
    if (index >= N) return;

    int spatialInv = 1 / (spatial * batch); // Precompute frequently used value
    int f = (index/spatial)%filters;

    float varInv = 1.F / (sqrtf(variance[f]) + .000001f); // Precompute inverse variance
    float delta_value = delta[index];
    float value_diff = 2.0f * variance_delta[f] * (x[index] - mean[f]);

    delta[index] = delta_value * varInv + value_diff * spatialInv + mean_delta[f] * spatialInv;
}