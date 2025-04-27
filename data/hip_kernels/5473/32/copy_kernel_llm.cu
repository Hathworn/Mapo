#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copy_kernel(int N, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Simplified thread index calculation
    int stride = gridDim.x * blockDim.x;  // Define stride for grid stride loop

    for (; i < N; i += stride) {  // Use grid stride loop for better performance
        Y[i * INCY + OFFY] = X[i * INCX + OFFX];
    }
}