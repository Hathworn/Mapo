#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void CopyRectangleCheckBoundsKernel(
    float *src, int srcOffset, int srcWidth, int srcHeight, 
    int srcRectX, int srcRectY, int rectWidth, int rectHeight, 
    float *dest, int destOffset, int destWidth, 
    int destRectX, int destRectY, float defaultValue) 
{
    // Calculate global thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x; 

    // Calculate grid-stride loop bounds
    int size = rectWidth * rectHeight; 

    // Loop over all elements to support grids larger than input size
    for (int index = id; index < size; index += blockDim.x * gridDim.x) {
        int localX = index % rectWidth;
        int localY = index / rectWidth;
        
        int srcPixelX = srcRectX + localX;
        int srcPixelY = srcRectY + localY;

        int destPixelX = destRectX + localX;
        int destPixelY = destRectY + localY;

        // Check if source pixel is within bounds before copying
        if (srcPixelX >= 0 && srcPixelX < srcWidth && srcPixelY >= 0 && srcPixelY < srcHeight) {
            (dest + destOffset)[destPixelX + destPixelY * destWidth] =
                (src + srcOffset)[srcPixelX + srcPixelY * srcWidth];
        } else {
            (dest + destOffset)[destPixelX + destPixelY * destWidth] = defaultValue;
        }
    }
}