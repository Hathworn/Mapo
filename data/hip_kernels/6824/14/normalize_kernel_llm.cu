#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_kernel(int N, float *x, float *mean, float *variance, int batch, int filters, int spatial)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Use stride loop to handle larger data sets and increase GPU utilization
    for (; index < N; index += blockDim.x * gridDim.x) {
        int f = (index / spatial) % filters;
        x[index] = (x[index] - mean[f]) / (sqrtf(variance[f] + .00001f));
    }
}