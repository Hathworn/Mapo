#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void copy_kernel(int N, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY)
{
    // Calculate unique thread index within the grid
    int i = blockIdx.x * blockDim.x + threadIdx.x; 

    // Ensure boundary checks to avoid accessing out-of-bound memory
    if(i < N) {
        Y[i * INCY + OFFY] = X[i * INCX + OFFX];
    }
}