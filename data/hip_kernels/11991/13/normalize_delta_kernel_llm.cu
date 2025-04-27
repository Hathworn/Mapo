#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_delta_kernel(int N, float *x, float *mean, float *variance, float *mean_delta, float *variance_delta, int batch, int filters, int spatial, float *delta)
{
    // Calculate unique thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure indexing within bounds
    if (index >= N) return;
    
    // Calculate the filter index
    int f = (index / spatial) % filters;
    
    // Pre-calculate commonly used values
    float inv_denom = 1.0f / (sqrt(variance[f]) + 0.000001f);
    float multiplier = 2.0f / (spatial * batch);

    // Compute new delta with pre-calculated values
    delta[index] = delta[index] * inv_denom + 
                   variance_delta[f] * multiplier * (x[index] - mean[f]) + 
                   mean_delta[f] / (spatial * batch);
}