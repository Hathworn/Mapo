#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void axpy_kernel(int N, float ALPHA, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate linear index
    int gridStride = blockDim.x * gridDim.x; // Determine grid stride

    while(i < N) {
        Y[OFFY+i*INCY] += ALPHA*X[OFFX+i*INCX]; // Perform axpy operation
        i += gridStride; // Advance to next index in stride
    }
}