#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_kernel(int N, float *x, float *mean, float *variance, int batch, int filters, int spatial)
{
    // Calculate the global index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index >= N) return;
    
    // Calculate the filter index directly
    int f = (index / spatial) % filters;
    
    // Precompute 1/sqrt(variance[f]) to avoid redundant computation
    float inv_sqrt_var = rsqrtf(variance[f] + .000001f);
    
    // Normalize the input
    x[index] = (x[index] - mean[f]) * inv_sqrt_var;
}