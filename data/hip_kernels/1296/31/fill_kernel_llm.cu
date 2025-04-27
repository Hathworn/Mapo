#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fill_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate the global thread index more efficiently
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;  // Calculate total number of threads processing the array
    
    // Use strided loop to allow multiple blocks to fill the array
    for (; i < N; i += stride) {
        X[i * INCX] = ALPHA;
    }
}