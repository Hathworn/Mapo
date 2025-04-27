#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void supp_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Check within bounds and perform computation
    if (i < N) {
        float val = X[i * INCX];
        if (val * val < ALPHA * ALPHA) {
            X[i * INCX] = 0;
        }
    }
}