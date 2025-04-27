```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void const_kernel(int N, float ALPHA, float *X, int INCX)
{
    int idx = threadIdx.x + blockDim.x * (blockIdx.x + blockIdx.y * gridDim.x);
    int stride = blockDim.x * gridDim.x * gridDim.y;

    // Loop to handle more data by the same thread
    for (int i = idx; i < N; i += stride) {
        X[i * INCX] = ALPHA;
    }
}