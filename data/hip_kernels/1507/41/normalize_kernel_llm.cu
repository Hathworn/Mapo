#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void normalize_kernel(int N, float *x, float *mean, float *variance, int batch, int filters, int spatial)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate global thread index
    if (index < N) {  // Check if within bounds
        int f = (index / spatial) % filters;  // Calculate filter index
        x[index] = (x[index] - mean[f]) / (sqrtf(variance[f]) + .000001f);  // Normalize
    }
}