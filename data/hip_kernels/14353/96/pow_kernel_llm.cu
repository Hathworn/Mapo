#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pow_kernel(int N, float ALPHA, float *X, int INCX, float *Y, int INCY)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int gridStride = gridDim.x * blockDim.x;
    
    // Use grid-stride loop to optimize accesses and utilize more threads
    for (int idx = i; idx < N; idx += gridStride) {
        Y[idx * INCY] = powf(X[idx * INCX], ALPHA);
    }
}