#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void daxpy_kernel(int n, double a, double *x, double *y)
{
    // Use 64-bit index calculations to support large arrays
    int i = blockIdx.x * (blockDim.x * 1) + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    for (; i < n; i += stride) {
        y[i] = a * x[i] + y[i];
    }
}