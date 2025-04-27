#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void float1toUchar4(float1 *inputImage, uchar4 *outputImage, int width, int height)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    int offset = y * width + x;

    if (x < width && y < height) {  // Ensure within bounds
        float1 pixelf = inputImage[offset];
        unsigned char pixelValue = (unsigned char)pixelf.x;
        uchar4 pixel = {pixelValue, pixelValue, pixelValue, pixelValue};
        outputImage[offset] = pixel;
    }
}