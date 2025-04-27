#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mul_kernel(int N, float *X, int INCX, float *Y, int INCY)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Loop through multiple elements if N is larger than the grid's capacity
    for(int idx = i; idx < N; idx += blockDim.x * gridDim.x) {
        Y[idx * INCY] *= X[idx * INCX]; // Perform multiplication
    }
}