#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernelB(float* r, float* x, float* y, float* z, int size)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index
    if (i < size) {
        r[i] = x[i] * y[i] + z[i]; // Perform computation if within bounds
    }
}