#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void axpy_kernel(int N, float ALPHA, float *X, int OFFX, int INCX,  float *Y, int OFFY, int INCY)
{
    // Optimize access by precalculating offsets
    int idxX = OFFX + threadIdx.x + blockIdx.x * blockDim.x;
    int idxY = OFFY + threadIdx.x + blockIdx.x * blockDim.x;

    // Check bounds inside the loop
    if(idxX * INCX < N && idxY * INCY < N) {
        Y[idxY * INCY] += ALPHA * X[idxX * INCX]; // Perform computation
    }
}