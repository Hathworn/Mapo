#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_delta_kernel(int N, float *x, float *mean, float *variance, float *mean_delta, float *variance_delta, int batch, int filters, int spatial, float *delta)
{
    // Calculate global index
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Exit if index is out of bounds
    if (index >= N) return;

    // Calculate the filter index
    int f = (index / spatial) % filters;

    // Pre-compute values used in the calculation to reduce redundant computations
    float inv_sqrt_var = rsqrtf(variance[f] + .00001f);
    float scale_factor = 2.0f / (spatial * batch);

    // Update delta with optimized expression
    delta[index] = delta[index] * inv_sqrt_var + variance_delta[f] * scale_factor * (x[index] - mean[f]) + mean_delta[f] / (spatial * batch);
}