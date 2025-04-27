#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void uchar4tofloat4(uchar4 *inputImage, float4 *outputImage, int width, int height)
{
    // Calculate the unique thread index for the 2D grid
    int offsetX = blockIdx.x * blockDim.x + threadIdx.x;
    int offsetY = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Ensure within bounds
    if (offsetX < width && offsetY < height)
    {
        // Use a single step to calculate the offset
        int offset = offsetY * width + offsetX;

        // Get pixel
        uchar4 pixel = inputImage[offset];

        // Optimize float4 assignment
        outputImage[offset] = make_float4(pixel.x, pixel.y, pixel.z, pixel.w);
    }
}