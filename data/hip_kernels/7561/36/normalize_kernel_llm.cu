#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_kernel(int N, float *x, float *mean, float *variance, int batch, int filters, int spatial)
{
    // Calculate global index
    int index = blockIdx.x * blockDim.x + threadIdx.x; 
    if (index >= N) return; 

    // Calculate filter index
    int f = (index / spatial) % filters;

    // Perform normalization
    float var_sqrt = sqrtf(variance[f]) + 1e-6f; // Reduced precision constant
    x[index] = (x[index] - mean[f]) / var_sqrt;
}