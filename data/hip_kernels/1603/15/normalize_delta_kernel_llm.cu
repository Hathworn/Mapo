#include "hip/hip_runtime.h"
#include "includes.h"

// Updated kernel with improved indexing and efficiency
__global__ void normalize_delta_kernel(int N, float *x, float *mean, float *variance, float *mean_delta, float *variance_delta, int batch, int filters, int spatial, float *delta)
{
    // Calculate global thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    if (index < N) { // Ensure within bounds
        int f = (index / spatial) % filters;

        // Cache frequent calculations
        float inv_sqrt_var = 1.f / sqrtf(variance[f] + .00001f);
        float norm_factor = 2.f / (spatial * batch);

        // Update delta with optimized computation
        delta[index] = delta[index] * inv_sqrt_var 
                       + variance_delta[f] * norm_factor * (x[index] - mean[f]) 
                       + mean_delta[f] * norm_factor;
    }
}