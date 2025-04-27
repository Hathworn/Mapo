#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void RgbToGray_Kernel(unsigned char * RGB_Image, unsigned char * Gray_Image, int Width, int Height)
{
    // Calculate global thread index
    int globalX = blockIdx.x * blockDim.x + threadIdx.x;
    int globalY = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Ensure the threads handle valid pixels only
    if (globalX < Width && globalY < Height)
    {
        // Calculate offsets
        int OffsetGray = globalY * Width + globalX;
        int OffsetColor = OffsetGray * 3; // Simplified as OffsetGray*3

        // Convert RGB to Grayscale using weighted sum
        Gray_Image[OffsetGray] = (unsigned char)(0.114f * RGB_Image[OffsetColor] 
                            + 0.587f * RGB_Image[OffsetColor + 1] 
                            + 0.299f * RGB_Image[OffsetColor + 2]);
    }
}