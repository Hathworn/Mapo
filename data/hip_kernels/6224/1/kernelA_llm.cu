#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelA(float* r, float* x, float* y, float* z, int size)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index
    int stride = blockDim.x * gridDim.x; // Calculate stride for the grid
    for (int i = idx; i < size; i += stride) { // Loop with global stride
        r[i] = x[i] * y[i] + z[i];
    }
}