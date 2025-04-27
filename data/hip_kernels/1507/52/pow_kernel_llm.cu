#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pow_kernel(int N, float ALPHA, float *X, int INCX, float *Y, int INCY)
{
    // Optimize the calculation of global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use an appropriate stride to process all elements
    int stride = blockDim.x * gridDim.x;
    
    for (int i = idx; i < N; i += stride) {
        Y[i * INCY] = powf(X[i * INCX], ALPHA);
    }
}