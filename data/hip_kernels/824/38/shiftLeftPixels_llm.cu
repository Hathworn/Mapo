#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void shiftLeftPixels(int16_t *bayImg, size_t width, size_t height, int bppMult)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    
    if (x < width && y < height)
    {
        // Calculate the index once for efficiency
        int idx = y * width + x;
        // Perform bit shift with pre-computed index
        bayImg[idx] <<= bppMult;
    }
}