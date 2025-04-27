#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mul_kernel(int N, float *X, int INCX, float *Y, int INCY)
{
    /* Use optimized calculation for unique thread index */
    int i = blockIdx.x * blockDim.x + threadIdx.x; 
    int stride = blockDim.x * gridDim.x; // Calculate stride

    // Iterate through the elements with stride for better utilization
    for (; i < N; i += stride) {
        Y[i * INCY] *= X[i * INCX];
    }
}