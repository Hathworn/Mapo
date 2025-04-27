#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copy_kernel(int N, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY)
{
    // Calculate thread's global index efficiently
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Loop through data using grid-stride loop to cover entire array
    for(; i < N; i += gridDim.x * blockDim.x) {
        Y[i * INCY + OFFY] = X[i * INCX + OFFX];
    }
}