#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_kernel(int N, float *x, float *mean, float *variance, int batch, int filters, int spatial)
{
    // Calculate the unique global thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure the index is within bounds
    if (index < N) {
        // Compute filter index using modulus operation directly
        int f = (index / spatial) % filters;
        
        // Normalize the element using precomputed mean and variance
        x[index] = (x[index] - mean[f]) / (sqrtf(variance[f]) + 1e-6f);
    }
}