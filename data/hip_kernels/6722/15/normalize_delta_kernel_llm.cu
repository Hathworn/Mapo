#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_delta_kernel(int N, float *x, float *mean, float *variance, float *mean_delta, float *variance_delta, int batch, int filters, int spatial, float *delta)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure index is within bounds
    if (index < N) {
        int f = (index / spatial) % filters;
        float inv_sqrt_var = rsqrtf(variance[f] + 1e-5f); // Use fast rsqrt function
        float var_delta_term = variance_delta[f] * 2.0f * (x[index] - mean[f]) / (spatial * batch);
        float mean_delta_term = mean_delta[f] / (spatial * batch);
        
        // Update delta with optimized computation
        delta[index] = delta[index] * inv_sqrt_var + var_delta_term + mean_delta_term;
    }
}