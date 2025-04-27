#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_delta_kernel(int N, float *x, float *mean, float *variance, float *mean_delta, float *variance_delta, int batch, int filters, int spatial, float *delta)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure thread index is within bounds
    if (index >= N) return;

    int stride = gridDim.x * blockDim.x;
    for (; index < N; index += stride) {
        int f = (index / spatial) % filters;

        // Calculate the normalization coefficients
        float inv_sqrt_var = 1.f / sqrtf(variance[f] + 0.00001f);
        float coeff1 = variance_delta[f] * 2.f / (spatial * batch);
        float coeff2 = mean_delta[f] / (spatial * batch);

        // Apply transformation
        delta[index] = delta[index] * inv_sqrt_var + coeff1 * (x[index] - mean[f]) + coeff2;
    }
}