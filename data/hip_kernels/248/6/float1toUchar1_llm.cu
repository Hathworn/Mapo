#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void float1toUchar1(float1 *inputImage, uchar1 *outputImage, int width, int height)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x; // Calculate x-coordinate uniquely for each thread
    int y = blockIdx.y * blockDim.y + threadIdx.y; // Calculate y-coordinate uniquely for each thread
    
    if(x < width && y < height) // Boundary check for image dimensions
    {
        int offset = y * width + x; // Calculate 1D offset from 2D coordinates

        float1 pixelf = inputImage[offset];
        uchar1 pixel;
        pixel.x = (unsigned char)pixelf.x;

        outputImage[offset] = pixel;
    }
}