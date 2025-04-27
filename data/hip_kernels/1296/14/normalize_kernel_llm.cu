#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_kernel(int N, float *x, float *mean, float *variance, int batch, int filters, int spatial)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;
    if (index < N) {  // Check if index is within bounds
        int f = (index / spatial) % filters;
        float var = variance[f] + 0.00001f;  // Precompute for efficiency
        x[index] = (x[index] - mean[f]) / sqrtf(var);
    }
}