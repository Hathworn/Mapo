#include "hip/hip_runtime.h"
#include "includes.h"

extern "C" {
}

__global__ void normalize_delta_kernel(int N, float *x, float *mean, float *variance, float *mean_delta, float *variance_delta, int batch, int filters, int spatial, float *delta)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    
    // Loop to handle larger data uses stride
    for (; index < N; index += stride) {
        int f = (index / spatial) % filters;
        float var_sqrt = sqrt(variance[f]) + .000001f; // Precompute square root of variance
        float common_term = 1.0f / (spatial * batch); // Precompute common division
        delta[index] = delta[index] * 1.0f / var_sqrt 
                     + variance_delta[f] * 2.0f * (x[index] - mean[f]) * common_term 
                     + mean_delta[f] * common_term;
    }
}