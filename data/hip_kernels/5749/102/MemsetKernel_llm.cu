#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MemsetKernel(const float value, int w, int h, float *image)
{
    // Calculate the unique thread index
    int idx = blockDim.x * blockDim.y * blockIdx.y * gridDim.x + blockIdx.x * blockDim.x * blockDim.y 
              + threadIdx.y * blockDim.x + threadIdx.x;
              
    // Check for out-of-bounds condition
    if (idx >= w * h) return;

    // Set the value at the calculated linear index
    image[idx] = value;
}