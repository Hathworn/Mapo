#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copy_kernel(int N, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY) {
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Use a stride loop to improve memory bandwidth utilization
    for (int idx = i; idx < N; idx += blockDim.x * gridDim.x) {
        Y[idx * INCY + OFFY] = X[idx * INCX + OFFX];
    }
}