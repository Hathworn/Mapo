```cuda
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernelA(float* r, float* x, float* y, float* z, int size)
{
    // Calculate global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Stride loop to ensure all elements are processed
    while (i < size) {
        r[i] = x[i] * y[i] + z[i];
        i += blockDim.x * gridDim.x;
    }
}