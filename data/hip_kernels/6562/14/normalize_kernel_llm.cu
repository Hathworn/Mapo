#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_kernel(int N, float *x, float *mean, float *variance, int batch, int filters, int spatial)
{
    // Use threadIdx.x to calculate the index directly and add a branch-less approach for out-of-bound checks
    int index = blockIdx.y * gridDim.x * blockDim.x + blockIdx.x * blockDim.x + threadIdx.x; 
    if (index < N) {
        int f = (index / spatial) % filters; // Calculate filter index
        float var_adjust = sqrtf(variance[f] + .00001f); // Compute adjusted variance
        x[index] = (x[index] - mean[f]) / var_adjust; // Normalize
    }
}