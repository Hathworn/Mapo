#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fill_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Use more than one thread per block for better performance
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;
    int stride = blockDim.x * gridDim.x; // Calculate the stride for threads

    for (; i < N; i += stride) {
        X[i * INCX] = ALPHA; // Ensure threads cover the entire range
    }
}