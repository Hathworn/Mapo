#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void pow_kernel(int N, float ALPHA, float *X, int INCX, float *Y, int INCY)
{
    // Calculate the global index, accounting for grid and block dimensions
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Stride over elements to allow handling of more elements per block
    int stride = gridDim.x * blockDim.x;
    
    for (; i < N; i += stride) {
        // Perform power operation for the given index and store result
        Y[i * INCY] = powf(X[i * INCX], ALPHA);
    }
}