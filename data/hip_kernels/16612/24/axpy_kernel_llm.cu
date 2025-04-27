#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void axpy_kernel(int N, float ALPHA, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY)
{
    // Calculate global index using optimized method
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Process multiple elements per thread
    for (int idx = i; idx < N; idx += blockDim.x * gridDim.x) {
        Y[OFFY + idx * INCY] += ALPHA * X[OFFX + idx * INCX];
    }
}