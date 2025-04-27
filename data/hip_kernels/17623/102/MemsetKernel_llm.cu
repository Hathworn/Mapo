#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MemsetKernel(const float value, int w, int h, float *image)
{
    // Calculate the unique global thread index for the 2D grid
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int j = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check bounds in a single comparison
    if (i < h && j < w)
    {
        int pos = i * w + j;
        image[pos] = value;
    }
}