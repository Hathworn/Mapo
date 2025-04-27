#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void const_kernel(int N, float ALPHA, float *X, int INCX)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Using a stride loop to cover all elements
    for (; i < N; i += stride) {
        X[i * INCX] = ALPHA;
    }
}