#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_kernel(int N, float *x, float *mean, float *variance, int batch, int filters, int spatial)
{
    // Calculate index based on block and thread information
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index < N) {
        // Calculate the filter index directly using modulo operation
        int f = (index / spatial) % filters;
        
        // Perform normalization using precomputed filter index
        x[index] = (x[index] - mean[f]) / sqrtf(variance[f] + .00001f);
    }
}