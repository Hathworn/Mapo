#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scal_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Loop with a stride to handle more elements per thread
    for (; i < N; i += gridDim.x * blockDim.x) {
        X[i * INCX] *= ALPHA;
    }
}