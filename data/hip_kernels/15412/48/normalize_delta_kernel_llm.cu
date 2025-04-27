#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_delta_kernel(int N, float *x, float *mean, float *variance, float *mean_delta, float *variance_delta, int batch, int filters, int spatial, float *delta)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    for (int i = index; i < N; i += stride) { // Use loop to handle larger grids
        int f = (i / spatial) % filters;
        
        float inv_sqrt_var = 1.F / (sqrtf(variance[f]) + .000001f); // Precompute invariant parts
        float variance_factor = variance_delta[f] * 2.F / (spatial * batch);
        float mean_factor = mean_delta[f] / (spatial * batch);

        delta[i] = delta[i] * inv_sqrt_var + variance_factor * (x[i] - mean[f]) + mean_factor;
    }
}