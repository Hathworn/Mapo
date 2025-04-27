#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_kernel(int N, float *x, float *mean, float *variance, int batch, int filters, int spatial)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index < N) {
        // Precalculate to minimize redundant operations
        int f = (index / spatial) % filters;
        float inv_std = 1.0f / sqrtf(variance[f] + 0.00001f);
        x[index] = (x[index] - mean[f]) * inv_std;
    }
}