#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copy_kernel(int N, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY) {
    // Calculate unique thread's global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;  // Calculate grid stride

    // Loop through array with grid stride loop to handle more elements
    for(int j = i; j < N; j += stride) {
        Y[j * INCY + OFFY] = X[j * INCX + OFFX];  // Perform copy operation
    }
}