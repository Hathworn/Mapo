#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_delta_kernel(int N, float *x, float *mean, float *variance, float *mean_delta, float *variance_delta, int batch, int filters, int spatial, float *delta)
{
    int index = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (index < N) {  // Simplify condition check to reduce divergent branches
        int f = (index / spatial) % filters;
        float var_sqrt = rsqrtf(variance[f] + 1e-5f);  // Use rsqrtf for faster computation
        float scale = 2.0f / (spatial * batch);  // Precompute repeated expression

        // Optimize calculation by using precomputed values
        delta[index] = delta[index] * var_sqrt 
                     + variance_delta[f] * scale * (x[index] - mean[f]) 
                     + mean_delta[f] / (spatial * batch);
    }
}