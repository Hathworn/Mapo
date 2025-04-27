#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copy_kernel(int N, float* X, int OFFX, int INCX, float* Y, int OFFY, int INCY) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x;  // Calculate the index using only 1D grid
    if (idx < N) {
        // Simplified access patterns to improve memory coalescing
        Y[idx * INCY + OFFY] = X[idx * INCX + OFFX];  
    }
}