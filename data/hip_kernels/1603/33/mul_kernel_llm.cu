#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mul_kernel(int N, float *X, int INCX, float *Y, int INCY)
{
    // Calculate global thread index efficiently
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use N and idx instead of i for clarity
    if (idx < N) {
        // Perform multiplication only for valid indices
        Y[idx * INCY] *= X[idx * INCX];
    }
}