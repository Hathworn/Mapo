#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_delta_kernel(int N, float *x, float *mean, float *variance, float *mean_delta, float *variance_delta, int batch, int filters, int spatial, float *delta)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Early return for invalid index
    if (index >= N) 
        return;
    
    int f = (index/spatial) % filters;
    float var_inv_sqrt = 1.f / sqrtf(variance[f] + .00001f); // Precompute inverse sqrt of variance
    float common_term = mean_delta[f] / (spatial * batch);  // Precompute common term

    // Optimize delta computation by reusing computations
    delta[index] = (delta[index] * var_inv_sqrt) + (variance_delta[f] * 2.f * (x[index] - mean[f]) / (spatial * batch)) + common_term;
}