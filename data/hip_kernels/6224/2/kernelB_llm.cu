#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelB(float* r, float* x, float* y, float* z, int size)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index
    int stride = blockDim.x * gridDim.x; // Calculate stride for each thread
    for (int i = index; i < size; i += stride) {
        r[i] = x[i] * y[i] + z[i]; // Perform vector operation
    }
}