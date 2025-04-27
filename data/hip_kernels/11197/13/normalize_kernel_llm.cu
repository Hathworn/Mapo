#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_kernel(int N, float *x, float *mean, float *variance, int batch, int filters, int spatial)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;  // Calculate stride for grid-stride loop
    while (index < N) {
        int f = (index/spatial) % filters;
        x[index] = (x[index] - mean[f]) / (sqrtf(variance[f] + .00001f));
        index += stride;  // Increment index by stride
    }
}