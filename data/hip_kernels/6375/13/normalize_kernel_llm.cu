#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_kernel(int N, float *x, float *mean, float *variance, int batch, int filters, int spatial)
{
    // Calculate the global index
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure within bounds
    if (index >= N) return;

    // Calculate filter index
    int f = (index / spatial) % filters;

    // Pre-compute sqrt variance
    float inv_std_dev = rsqrtf(variance[f] + 0.000001f);

    // Normalize the input
    x[index] = (x[index] - mean[f]) * inv_std_dev;
}