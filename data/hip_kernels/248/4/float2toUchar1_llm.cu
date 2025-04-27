#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void float2toUchar1(float2 *inputImage, uchar1 *outputImage, int width, int height, int index)
{
    // Optimize offset calculation using 2D block and thread indexing
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
  
    // Check boundaries to avoid accessing out of bounds
    if (x < width && y < height) {
        int offset = y * width + x; // Simplified offset calculation for 2D grid

        float2 pixelf = inputImage[offset];
        float pixelfIndexed = (index == 0) ? pixelf.x : pixelf.y;

        uchar1 pixel;
        pixel.x = (unsigned char)pixelfIndexed;

        outputImage[offset] = pixel;
    }
}