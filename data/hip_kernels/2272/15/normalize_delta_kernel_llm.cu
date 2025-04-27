```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_delta_kernel(int N, float *x, float *mean, float *variance, float *mean_delta, float *variance_delta, int batch, int filters, int spatial, float *delta)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index >= N) return;
    
    int f = (index / spatial) % filters;

    // Pre-calculate reusable constants to reduce redundant computation.
    float inv_sqrt_var = rsqrtf(variance[f] + 0.00001f);
    float scale_factor = 1.0f / (spatial * batch);

    // Simplify the computations using the pre-calculated constants.
    delta[index] = delta[index] * inv_sqrt_var 
                 + variance_delta[f] * 2.0f * (x[index] - mean[f]) * scale_factor
                 + mean_delta[f] * scale_factor;
}