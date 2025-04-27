#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized version of kernelA using grid-stride loop
__global__ void kernelA(float* r, float* x, float* y, float* z, int size)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Use grid-stride loop for improved parallelization
    for (int i = idx; i < size; i += stride) {
        r[i] = x[i] * y[i] + z[i];
    }
}