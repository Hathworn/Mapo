#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Use variable to cache constant multiplication for better efficiency
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;
    if (i < N) {
        X[i * INCX] += ALPHA; // Minimize arithmetic operations
    }
}