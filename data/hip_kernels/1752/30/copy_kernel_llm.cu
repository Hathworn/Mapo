#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copy_kernel(int N, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY)
{
    // Calculate global index
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * (gridDim.x * blockDim.x);
    
    // Use a stride loop to handle more elements per thread
    for(int idx = i; idx < N; idx += gridDim.x * blockDim.x * gridDim.y)
    {
        Y[idx*INCY + OFFY] = X[idx*INCX + OFFX];
    }
}