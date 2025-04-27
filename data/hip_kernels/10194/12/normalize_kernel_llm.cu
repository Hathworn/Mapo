#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_kernel(int N, float *x, float *mean, float *variance, int batch, int filters, int spatial)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index >= N) return;

    // Precompute reciprocal of standard deviation to avoid recalculating it
    int f = (index / spatial) % filters;
    float inv_stddev = 1.0f / (sqrt(variance[f]) + .000001f);

    // Apply normalization
    x[index] = (x[index] - mean[f]) * inv_stddev;
}