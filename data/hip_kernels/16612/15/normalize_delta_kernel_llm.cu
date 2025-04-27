#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_delta_kernel(int N, float *x, float *mean, float *variance, float *mean_delta, float *variance_delta, int batch, int filters, int spatial, float *delta)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index < N) { // Optimize guard check by moving inside the main logic
        int f = (index / spatial) % filters;
        // Precompute reused values for efficiency
        float var_f_inv_sqrt = rsqrtf(variance[f] + .00001f);
        float spatial_batch = spatial * batch;
        float x_mean_diff = x[index] - mean[f];

        // Use of precomputed values
        delta[index] = delta[index] * var_f_inv_sqrt 
                     + variance_delta[f] * 2.f * x_mean_diff / spatial_batch 
                     + mean_delta[f] / spatial_batch;
    }
}