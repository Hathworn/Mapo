#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelB(float* r, float* x, float* y, float* z, int size)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure thread index is within array bounds
    if (i < size) {
        r[i] = x[i] * y[i] + z[i];
    }
}