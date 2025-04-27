#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void constrain_kernel(int N, float ALPHA, float *X, int INCX)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Simplify index calculation
    int stride = gridDim.x * blockDim.x; // Calculate stride for loop unrolling
    for (int i = idx; i < N; i += stride) { // Loop unrolling to improve memory access pattern
        float val = X[i * INCX];
        // Simplify fminf and fmaxf by using minimum and maximum functions
        X[i * INCX] = fminf(ALPHA, fmaxf(-ALPHA, val));
    }
}