#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MemsetKernel(const float value, int w, int h, float *image)
{
    // Calculate the linear index directly
    int pos = blockIdx.x * blockDim.x + threadIdx.x + 
              (blockIdx.y * blockDim.y + threadIdx.y) * w;

    if (pos >= w * h) return; // Exit if out of bounds

    image[pos] = value; // Assign value
}