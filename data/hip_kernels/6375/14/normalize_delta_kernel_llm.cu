#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void normalize_delta_kernel(int N, float *x, float *mean, float *variance, float *mean_delta, float *variance_delta, int batch, int filters, int spatial, float *delta)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;  // Simplified index calculation
    int stride = blockDim.x * gridDim.x;  // Calculate stride for iteration
    for (; index < N; index += stride) {  // Iterate across all elements
        int f = (index / spatial) % filters;
        float inv_sqrt_var = 1.0f / (sqrt(variance[f]) + .000001f);  // Precompute 1/sqrt(variance[f])
        float two_spatial_batch = 2.0f / (spatial * batch);  // Precompute constant value

        delta[index] = delta[index] * inv_sqrt_var
                     + variance_delta[f] * two_spatial_batch * (x[index] - mean[f])
                     + mean_delta[f] / (spatial * batch);
    }
}