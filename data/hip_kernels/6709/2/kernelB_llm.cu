#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelB(float* r, float* x, float* y, float* z, int size)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Loop over each global thread, with stride of total threads
    for (; i < size; i += blockDim.x * gridDim.x) {
        r[i] = x[i] * y[i] + z[i];
    }
}