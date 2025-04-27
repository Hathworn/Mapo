#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void shiftRightPixels(int16_t *bayImg, size_t width, size_t height, int bppMult)
{
    // Calculate the linear index directly to avoid recomputation
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    
    if (x < width && y < height)
    {
        // Use linear indexing for direct memory access
        bayImg[y * width + x] >>= bppMult;
    }
}