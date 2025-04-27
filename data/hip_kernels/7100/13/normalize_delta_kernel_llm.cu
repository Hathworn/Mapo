#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_delta_kernel(int N, float *x, float *mean, float *variance, float *mean_delta, float *variance_delta, int batch, int filters, int spatial, float *delta)
{
    // Calculate the global index
    int index = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;
    
    // Only process valid indices
    if (index < N) {
        // Compute the filter index
        int f = (index / spatial) % filters;
        
        // Pre-calculate constant values to avoid redundant computations
        float inv_std = 1.0f / (sqrtf(variance[f]) + 1e-6f);
        float coeff = variance_delta[f] * 2.0f / (spatial * batch);
        
        // Update delta
        delta[index] = delta[index] * inv_std +
                       coeff * (x[index] - mean[f]) +
                       mean_delta[f] / (spatial * batch);
    }
}