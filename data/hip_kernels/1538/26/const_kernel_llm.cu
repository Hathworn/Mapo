#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void const_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Compute the unique thread index.
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Parallelize the assignment over threads in steps of total threads.
    for (; i < N; i += gridDim.x * blockDim.x) {
        X[i * INCX] = ALPHA;
    }
}