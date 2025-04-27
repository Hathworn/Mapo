#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void fill_kernel(int N, float ALPHA, float *X, int INCX)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Use loop to handle multiple elements per thread
    for (; index < N; index += stride) {
        X[index * INCX] = ALPHA;
    }
}