#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void const_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate the global index for the thread
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;  // Calculate stride for efficient grid-stride looping

    // Use grid-stride loop to handle larger arrays efficiently
    for (; i < N; i += stride) {
        X[i * INCX] = ALPHA;
    }
}