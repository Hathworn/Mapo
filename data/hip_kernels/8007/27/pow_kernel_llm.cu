#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pow_kernel(int N, float ALPHA, float *X, int INCX, float *Y, int INCY)
{
    // Each thread processes multiple elements
    int idx = (blockIdx.x * blockDim.x + threadIdx.x);
    int stride = gridDim.x * blockDim.x; // Calculate stride to process larger arrays evenly

    for (int i = idx; i < N; i += stride)
    {
        Y[i * INCY] = pow(X[i * INCX], ALPHA); // Process elements
    }
}