#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pow_kernel(int N, float ALPHA, float *X, int INCX, float *Y, int INCY)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Use 1D grid
    int stride = gridDim.x * blockDim.x; // Calculate stride for more efficient iteration
    for (int idx = i; idx < N; idx += stride) // Loop to cover full range
    {
        Y[idx * INCY] = powf(X[idx * INCX], ALPHA);
    }
}