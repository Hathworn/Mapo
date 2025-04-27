#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void axpy_kernel(int N, float ALPHA, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY)
{
    // Use blockIdx.x + blockIdx.y*gridDim.x to flatten and calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;
    
    // Check if the thread index i is within bounds, then compute
    if (i < N) {
        Y[OFFY + i * INCY] += ALPHA * X[OFFX + i * INCX];
    }
}