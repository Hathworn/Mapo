#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scal_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;  // Calculate the stride

    // Use a loop to handle larger data sizes more efficiently
    for (; i < N; i += stride) {
        X[i * INCX] *= ALPHA;  // Scale the vector element
    }
}