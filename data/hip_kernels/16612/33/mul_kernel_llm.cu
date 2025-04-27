#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mul_kernel(int N, float *X, int INCX, float *Y, int INCY)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified calculation of global index
    int stride = gridDim.x * blockDim.x; // Calculate the total number of threads

    for (; i < N; i += stride) { // Use stride loop for better workload distribution
        Y[i * INCY] *= X[i * INCX]; // Perform multiplication
    }
}