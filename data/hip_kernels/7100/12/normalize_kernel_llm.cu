#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_kernel(int N, float *x, float *mean, float *variance, int batch, int filters, int spatial)
{
    // Calculate index using faster grid-stride loop
    for (int index = blockIdx.x * blockDim.x + threadIdx.x; index < N; index += blockDim.x * gridDim.x) {
        int f = (index / spatial) % filters;

        // Perform normalization
        x[index] = (x[index] - mean[f]) / (sqrt(variance[f]) + .000001f);
    }
}