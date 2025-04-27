#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mul_kernel(int N, float *X, int INCX, float *Y, int INCY)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Use 1D block indexing
    int stride = blockDim.x * gridDim.x; // Calculate the stride

    // Loop over the data with a stride
    for (int idx = i; idx < N; idx += stride) {
        Y[idx * INCY] *= X[idx * INCX]; // Optimize memory access pattern
    }
}