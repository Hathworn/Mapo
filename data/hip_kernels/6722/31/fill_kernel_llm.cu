#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void fill_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    // Optimize by using stride loop
    for (int index = i; index < N; index += stride) {
        X[index * INCX] = ALPHA;
    }
}