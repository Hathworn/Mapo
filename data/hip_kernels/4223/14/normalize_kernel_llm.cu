#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_kernel(int N, float *x, float *mean, float *variance, int batch, int filters, int spatial)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate global thread index
    int stride = gridDim.x * blockDim.x;  // Calculate total number of threads

    for (int i = index; i < N; i += stride) {  // Iterate over elements in increments of total threads
        int f = (i / spatial) % filters;
        x[i] = (x[i] - mean[f]) / (sqrtf(variance[f] + .00001f));
    }
}