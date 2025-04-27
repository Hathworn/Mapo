```c
#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel function optimized for better memory and computation efficiency
__global__ void normalize_kernel(int N, float *x, float *mean, float *variance, int batch, int filters, int spatial)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x; // Calculate stride for grid-stride loop

    for (int i = index; i < N; i += stride) { // Use grid-stride loop for optimization
        int f = (i / spatial) % filters;
        x[i] = (x[i] - mean[f]) / (sqrtf(variance[f] + .00001f)); // Normalize value
    }
}