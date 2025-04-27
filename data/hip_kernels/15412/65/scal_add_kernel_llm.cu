#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scal_add_kernel(int N, float ALPHA, float BETA, float *X, int INCX)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x; // Calculate stride for loop unrolling

    for (int idx = i; idx < N; idx += stride) { // Loop unrolling for better parallelism
        X[idx * INCX] = X[idx * INCX] * ALPHA + BETA;
    }
}