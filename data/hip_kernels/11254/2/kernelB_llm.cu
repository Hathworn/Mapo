#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelB(float* r, float* x, float* y, float* z, int size)
{
    // Calculate global index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use global index for processing
    if (index < size) {
        r[index] = x[index] * y[index] + z[index];
    }
}