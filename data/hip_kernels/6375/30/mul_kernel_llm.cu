#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mul_kernel(int N, float *X, int INCX, float *Y, int INCY)
{
    // Use a 1D grid for improved performance
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure we don't process out-of-bound indices
    if (i < N) {
        // Fetch the values first to improve memory access efficiency
        float x_val = X[i * INCX]; 
        float y_val = Y[i * INCY];
        Y[i * INCY] = y_val * x_val;
    }
}