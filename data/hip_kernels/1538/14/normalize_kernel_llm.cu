#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_kernel(int N, float *x, float *mean, float *variance, int batch, int filters, int spatial)
{
    // Calculate the global index using a single dimension for thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a loop to prevent unused threads
    for (; index < N; index += blockDim.x * gridDim.x) {
        int f = (index / spatial) % filters;

        // Optimize computation: precompute sqrtf value
        float inv_stddev = rsqrtf(variance[f] + 1e-5f);

        // Apply normalization using the precomputed value
        x[index] = (x[index] - mean[f]) * inv_stddev;
    }
}