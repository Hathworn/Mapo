#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_kernel(int N, float *x, float *mean, float *variance, int batch, int filters, int spatial)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Optimize looping by iterating over flattened index space
    for (int i = index; i < N; i += stride) {
        int f = (i / spatial) % filters;
        x[i] = (x[i] - mean[f]) / (sqrt(variance[f] + .00001f));
    }
}