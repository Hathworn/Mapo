#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void convertRGBtoGrayScale(uint8_t* src, uint8_t* dst, int width, int height, int channels)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Ensure thread safety and bounds checking
    if (x < width && y < height) {
        int grayOffset = y * width + x;
        int rgbOffset = grayOffset * channels;
        
        unsigned char r = src[rgbOffset];          // red value for pixel
        unsigned char g = src[rgbOffset + 1];      // corrected index for green
        unsigned char b = src[rgbOffset + 2];      // corrected index for blue
        
        // Calculate grayscale value using linear approximation
        dst[grayOffset] = __float2uint_rn(0.21f * r + 0.71f * g + 0.07f * b);
    }
}