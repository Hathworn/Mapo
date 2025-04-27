#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pow_kernel(int N, float ALPHA, float *X, int INCX, float *Y, int INCY)
{
    // Optimize index calculation using 2D grid mapping
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;

    // Use shared memory for temporary data storage (if applicable)
    if (i < N) {
        float x_val = X[i * INCX]; // Load once for reuse
        Y[i * INCY] = powf(x_val, ALPHA); // Use faster powf for float
    }
}