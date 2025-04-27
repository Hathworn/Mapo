#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pow_kernel(int N, float ALPHA, float *X, int INCX, float *Y, int INCY)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Compute linear index for 1D grid
    if(i < N)
    {
        int idxX = i * INCX; // Compute index for X
        int idxY = i * INCY; // Compute index for Y
        Y[idxY] = powf(X[idxX], ALPHA); // Use powf for float
    }
}