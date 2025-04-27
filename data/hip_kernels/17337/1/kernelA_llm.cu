#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernelA(float* r, float* x, float* y, float* z, int size)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index
    if (i < size) { // Ensure index is within bounds
        r[i] = x[i] * y[i] + z[i];
    }
}