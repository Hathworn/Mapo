#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_kernel(int N, float *x, float *mean, float *variance, int batch, int filters, int spatial)
{
    // Calculate linear global index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure the index is within bounds
    if (index < N) {
        int f = (index / spatial) % filters;
        
        // Normalize x[index]
        x[index] = (x[index] - mean[f]) / sqrtf(variance[f] + .00001f);
    }
}