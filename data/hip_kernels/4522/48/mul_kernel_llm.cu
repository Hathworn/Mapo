#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mul_kernel(int N, float *X, int INCX, float *Y, int INCY)
{
    // Calculate global index based on the thread and block
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure the computed index is within array bounds
    if (i < N) {
        // Perform element-wise multiplication
        Y[i * INCY] *= X[i * INCX];
    }
}