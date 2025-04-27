#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_delta_kernel(int N, float *x, float *mean, float *variance, float *mean_delta, float *variance_delta, int batch, int filters, int spatial, float *delta)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    
    // Use a loop to allow multiple threads to process multiple elements
    for (; index < N; index += stride) {
        int f = (index/spatial) % filters;

        // Perform normalization and update delta
        float inv_sqrt_variance = 1.F / (sqrtf(variance[f]) + .000001f);
        delta[index] = delta[index] * inv_sqrt_variance 
                     + variance_delta[f] * 2.F * (x[index] - mean[f]) / (spatial * batch) 
                     + mean_delta[f] / (spatial * batch);
    }
}