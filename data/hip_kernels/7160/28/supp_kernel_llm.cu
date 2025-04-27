#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void supp_kernel(int N, float ALPHA, float *X, int INCX)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Optimize thread index calculation for 1D grid
    if (i < N) {
        float value = X[i * INCX];
        if ((value * value) < (ALPHA * ALPHA)) X[i * INCX] = 0;  // Cache value to reduce redundant memory access
    }
}