#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_delta_kernel(int N, float *x, float *mean, float *variance, float *mean_delta, float *variance_delta, int batch, int filters, int spatial, float *delta) 
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure we only access valid array indices
    if (index < N) {
        int f = (index / spatial) % filters;

        // Precompute recurrent values to reduce processing time
        float var_sqrt_inv = 1.F / (sqrtf(variance[f]) + .000001f);
        float spatial_batch_inv = 1.F / (spatial * batch);
        float delta_val = variance_delta[f] * 2. * (x[index] - mean[f]) * spatial_batch_inv;
        
        // Optimize memory usage and computation
        delta[index] = delta[index] * var_sqrt_inv + delta_val + mean_delta[f] * spatial_batch_inv;
    }
}