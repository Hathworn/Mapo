#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelA(float* r, float* x, float* y, float* z, int size)
{
    // Calculate the global index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure the index is within bounds
    if (idx < size) {
      r[idx] = x[idx] * y[idx] + z[idx];
    }
}