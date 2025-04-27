#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void pow_kernel(int N, float ALPHA, float *X, int INCX, float *Y, int INCY)
{
    // Use tile-friendly access pattern to improve coalesced memory access
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    for(; i < N; i += stride) {
        Y[i*INCY] = powf(X[i*INCX], ALPHA);
    }
}