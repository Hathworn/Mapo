#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void normalize_kernel(int N, float *x, float *mean, float *variance, int batch, int filters, int spatial)
{
    // Calculate unique thread index across grid
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x; // Compute stride for efficient grid-stride loop
    for (int i = index; i < N; i += stride) { 
        int f = (i / spatial) % filters; // Calculate filter index
        x[i] = (x[i] - mean[f]) / (sqrtf(variance[f] + .00001f)); // Normalize
    }
}