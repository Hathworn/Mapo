#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelB(float* r, float* x, float* y, float* z, int size)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index

    if (idx < size) { // Check if index is within the range
        r[idx] = x[idx] * y[idx] + z[idx]; // Perform computation
    }
}