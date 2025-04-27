#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copy_kernel(int N, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY)
{
    // Optimize memory access and loop iteration using a single active warp per block
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation
    int stride = blockDim.x * gridDim.x; // Stride to cover all elements

    for (int i = idx; i < N; i += stride) {
        Y[i * INCY + OFFY] = X[i * INCX + OFFX];
    }
}