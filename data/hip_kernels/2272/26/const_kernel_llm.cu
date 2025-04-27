#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void const_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Iterate over elements processed by this thread block
    int stride = blockDim.x * gridDim.x;

    for (; i < N; i += stride) {
        X[i * INCX] = ALPHA;
    }
}