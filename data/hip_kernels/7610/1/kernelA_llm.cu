#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelA(float* r, float* x, float* y, float* z, int size)
{
    // Calculate global index for each thread
    int globalIndex = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure the thread works within bounds
    if (globalIndex < size) {
        r[globalIndex] = x[globalIndex] * y[globalIndex] + z[globalIndex];
    }
}