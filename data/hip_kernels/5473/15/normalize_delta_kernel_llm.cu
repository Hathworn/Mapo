#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_delta_kernel(int N, float *x, float *mean, float *variance, float *mean_delta, float *variance_delta, int batch, int filters, int spatial, float *delta)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x; // For processing beyond the block

    for (int i = index; i < N; i += stride) { // Loop to cover all elements
        int f = (i / spatial) % filters;
        
        float inv_sqrt_var = 1.f / sqrtf(variance[f] + .00001f); // Pre-calculate inverse sqrt variance
        float val_delta = variance_delta[f] * 2.f * (x[i] - mean[f]) / (spatial * batch) + mean_delta[f] / (spatial * batch);
        
        delta[i] = delta[i] * inv_sqrt_var + val_delta; 
    }
}