#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernelB(float* r, float* x, float* y, float* z, int size)
{
    // Calculate global thread index
    int globalIdx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Optimize loop with a single calculation using the global index
    if (globalIdx < size) {
        r[globalIdx] = x[globalIdx] * y[globalIdx] + z[globalIdx];
    }
}