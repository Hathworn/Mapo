#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void const_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Use efficient loop for processing in case N > total threads
    while (i < N) {
        X[i * INCX] = ALPHA;
        i += stride; // Move to next batch
    }
}