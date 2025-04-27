#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate the global index more efficiently
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use strided access to cover all elements
    int stride = blockDim.x * gridDim.x;
    for (; i < N; i += stride) {
        X[i * INCX] += ALPHA;
    }
}