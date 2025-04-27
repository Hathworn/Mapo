#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel for better performance by avoiding calculating i for out-of-bounds threads
__global__ void binarize_kernel(float *x, int n, float *binary)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int totalThreads = blockDim.x * gridDim.x;
    for (; i < n; i += totalThreads) {
        binary[i] = (x[i] >= 0) ? 1 : -1;
    }
}