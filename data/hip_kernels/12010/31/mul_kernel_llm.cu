#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mul_kernel(int N, float *X, int INCX, float *Y, int INCY)
{
    // Utilize more threads per block by using a 2D grid
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int idy = blockIdx.y * blockDim.y + threadIdx.y;
    int index = idy * gridDim.x * blockDim.x + idx;
    
    if(index < N) {
        Y[index * INCY] *= X[index * INCX];
    }
}