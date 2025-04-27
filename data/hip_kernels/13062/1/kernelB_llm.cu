#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelB(float* r, float* x, float* y, float* z, int size)
{
    // Use a more efficient thread index calculation to reduce redundant operations
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x; // Calculate stride for full grid coverage

    for (; i < size; i += stride) {
        r[i] = x[i] * y[i] + z[i];
    }
}