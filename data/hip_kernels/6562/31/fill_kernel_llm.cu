#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fill_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate a unique global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Loop to handle large arrays, more efficient than single if check
    for (; i < N; i += stride) {
        X[i * INCX] = ALPHA;
    }
}