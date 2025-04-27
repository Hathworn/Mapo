#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_kernel(int N, float *x, float *mean, float *variance, int batch, int filters, int spatial)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x; // Calculate 1D index
    if (index < N) {
        // Precompute filter index
        int f = (index / spatial) % filters;
        
        // Normalize the element
        x[index] = (x[index] - mean[f]) / (sqrtf(variance[f]) + .000001f);
    }
}