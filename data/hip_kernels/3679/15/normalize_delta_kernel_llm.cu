#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_delta_kernel(int N, float *x, float *mean, float *variance, float *mean_delta, float *variance_delta, int batch, int filters, int spatial, float *delta)
{
    // Calculate the global thread index to avoid redundant calculations.
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure index is within bounds for kernel execution.
    if (index < N) {
        // Calculate filter index using modulo operation.
        int f = (index / spatial) % filters;

        // Precompute reused expressions to enhance performance.
        float inv_sqrt_variance = rsqrtf(variance[f] + 0.00001f); // Use rsqrtf for better precision and speed
        float variance_delta_coeff = variance_delta[f] * 2.f / (spatial * batch);
        float mean_delta_coeff = mean_delta[f] / (spatial * batch);

        // Update delta with optimized expression.
        delta[index] = delta[index] * inv_sqrt_variance + variance_delta_coeff * (x[index] - mean[f]) + mean_delta_coeff;
    }
}