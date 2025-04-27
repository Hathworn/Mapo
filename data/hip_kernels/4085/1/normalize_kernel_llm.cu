#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void normalize_kernel(int N, float *x, float *mean, float *variance, int batch, int filters, int spatial)
{
    // Use blockIdx.x + blockIdx.y * gridDim.x for 2D block indices
    int index = blockIdx.x * blockDim.x + threadIdx.x; 
    int gridStride = gridDim.x * blockDim.x; // Calculate grid stride

    for (int i = index; i < N; i += gridStride) // Loop to cover all elements
    {
        int f = (i / spatial) % filters; // Calculate filter index
        x[i] = (x[i] - mean[f]) / (sqrtf(variance[f]) + .000001f); // Normalize
    }
}