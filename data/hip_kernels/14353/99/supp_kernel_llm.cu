#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void supp_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate the unique thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;

    // Load X[i*INCX] to a register to avoid redundant memory access
    if (i < N) {
        float xi = X[i * INCX];
        if ((xi * xi) < (ALPHA * ALPHA)) {
            X[i * INCX] = 0;
        }
    }
}