#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_kernel(int N, float *x, float *mean, float *variance, int batch, int filters, int spatial)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index >= N) return;

    // Pre-fetch mean and variance to avoid redundant global memory accesses
    int f = (index / spatial) % filters;
    float m = mean[f];
    float v = variance[f];
    
    x[index] = (x[index] - m) / sqrtf(v + 0.00001f); // Normalize
}