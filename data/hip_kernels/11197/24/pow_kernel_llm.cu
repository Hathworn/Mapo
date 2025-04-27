#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pow_kernel(int N, float ALPHA, float *X, int INCX, float *Y, int INCY)
{
    // Calculate thread ID
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;
    
    // Ensure within bounds
    if (i < N) {
        // Calculate index based on increments and apply operation
        int indexX = i * INCX; 
        int indexY = i * INCY; 
        Y[indexY] = powf(X[indexX], ALPHA); // Use powf for float precision
    }
}