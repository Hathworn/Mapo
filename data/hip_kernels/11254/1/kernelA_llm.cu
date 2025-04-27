#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelA(float* r, float* x, float* y, float* z, int size) 
{
    // Use grid-stride loop for better occupancy and performance
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    
    for (; i < size; i += stride) {
        r[i] = x[i] * y[i] + z[i];
    }
}