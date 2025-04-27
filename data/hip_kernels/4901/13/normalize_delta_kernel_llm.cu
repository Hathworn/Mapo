#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_delta_kernel(int N, float *x, float *mean, float *variance, float *mean_delta, float *variance_delta, int batch, int filters, int spatial, float *delta)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x; // Simplified 1D grid computation
    if (index >= N) return;
    int f = (index / spatial) % filters;

    float std_inv = rsqrtf(variance[f] + .000001f); // Use fast inverse square root
    float val = x[index] - mean[f];
    float delta_val = delta[index];

    delta[index] = delta_val * std_inv +
                   variance_delta[f] * 2.0f * val / (spatial * batch) +
                   mean_delta[f] / (spatial * batch);
}