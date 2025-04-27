#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_delta_kernel(int N, float *x, float *mean, float *variance, float *mean_delta, float *variance_delta, int batch, int filters, int spatial, float *delta)
{
    // Calculate unique global index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure we do not exceed bounds
    if (index >= N) return;

    // Calculate filter index
    int f = (index / spatial) % filters;

    // Use floating-point constant and common subexpression elimination to optimize
    float one_over_sqrt_var = 1.0f / (sqrtf(variance[f]) + 0.000001f);
    float two_over_spatial_batch = 2.0f / (spatial * batch);

    // Update delta using optimized expression
    delta[index] = delta[index] * one_over_sqrt_var + 
                   variance_delta[f] * two_over_spatial_batch * (x[index] - mean[f]) + 
                   mean_delta[f] / (spatial * batch);
}