```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_delta_kernel(int N, float *x, float *mean, float *variance, float *mean_delta, float *variance_delta, int batch, int filters, int spatial, float *delta)
{
    // Calculate the unique thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (index >= N) return; // Boundary check
    
    // Calculate the filter index
    int f = (index / spatial) % filters;

    // Precompute common expressions to minimize repeated operations
    float inv_sqrt_var = 1.f / sqrtf(variance[f] + .00001f);
    float two_var_delta = 2.f * variance_delta[f] / (spatial * batch);
    float mean_delta_factor = mean_delta[f] / (spatial * batch);

    // Optimize by reusing computed values
    delta[index] = delta[index] * inv_sqrt_var 
                   + two_var_delta * (x[index] - mean[f]) 
                   + mean_delta_factor;
}