#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copy_kernel(int N, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;
    int index = j * gridDim.x * blockDim.x + i;

    // Coalesced memory access and leveraging more parallel threads
    if(index < N) 
    {
        Y[index * INCY + OFFY] = X[index * INCX + OFFX];
    }
}