#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void copy_kernel(int N, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY) {
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate the global index using blockIdx.x
    int stride = gridDim.x * blockDim.x; // Calculate the total number of threads processing across all blocks

    // Loop over the data with a stride to process multiple elements per thread
    for (; i < N; i += stride) {
        Y[i * INCY + OFFY] = X[i * INCX + OFFX];
    }
}