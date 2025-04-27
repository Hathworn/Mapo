#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void float2toUchar4(float2 *inputImage, uchar4 *outputImage, int width, int height, int index)
{
    // Calculate global thread index more efficiently
    int offset = blockIdx.x * blockDim.x + threadIdx.x + 
                 (blockIdx.y * blockDim.y + threadIdx.y) * width;

    if (offset < width * height) // Ensure within bounds
    {
        float2 pixelf = inputImage[offset];
        float pixelfIndexed = (index == 0) ? pixelf.x : pixelf.y;

        unsigned char absPixel = (unsigned char)abs(pixelfIndexed);

        uchar4 pixel;
        // Set all channels using a single variable
        pixel.x = absPixel; 
        pixel.y = absPixel;
        pixel.z = absPixel; 
        pixel.w = absPixel;

        outputImage[offset] = pixel;
    }
}