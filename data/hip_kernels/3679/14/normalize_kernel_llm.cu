#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_kernel(int N, float *x, float *mean, float *variance, int batch, int filters, int spatial)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;
    if (index >= N) return;
    
    // Calculate filter index for the current element
    int f = (index / spatial) % filters;

    // Normalize the element using pre-computed mean and variance
    float norm = sqrtf(variance[f] + 1e-5f);
    x[index] = (x[index] - mean[f]) / norm;
}