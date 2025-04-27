#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_delta_kernel(int N, float *x, float *mean, float *variance, float *mean_delta, float *variance_delta, int batch, int filters, int spatial, float *delta)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index >= N) return;

    // Precompute common values outside the critical loop
    int f = (index / spatial) % filters;
    float inv_var_sqrt = 1.f / sqrtf(variance[f] + 0.00001f);
    float spatial_batch = spatial * batch;

    // Optimize redundant calculations in the kernel
    delta[index] = delta[index] * inv_var_sqrt 
                 + variance_delta[f] * 2.f * (x[index] - mean[f]) / spatial_batch 
                 + mean_delta[f] / spatial_batch;
}