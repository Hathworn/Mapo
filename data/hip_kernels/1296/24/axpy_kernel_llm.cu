#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void axpy_kernel(int N, float ALPHA, float *X, int OFFX, int INCX,  float *Y, int OFFY, int INCY)
{
    // Use blockIdx.x directly for the index calculation
    int i = blockIdx.x * blockDim.x + threadIdx.x; 
    // Loop over the elements this thread is responsible for
    for (int idx = i; idx < N; idx += blockDim.x * gridDim.x) {
        Y[OFFY + idx * INCY] += ALPHA * X[OFFX + idx * INCX];
    }
}