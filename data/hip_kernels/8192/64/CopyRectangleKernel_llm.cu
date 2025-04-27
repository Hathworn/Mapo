#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void CopyRectangleKernel(float *src, int srcOffset, int srcWidth, int srcRectX, int srcRectY, 
                                    int rectWidth, int rectHeight, float *dest, int destOffset, int destWidth, 
                                    int destRectX, int destRectY) 
{
    int x = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global x index
    int y = blockIdx.y * blockDim.y + threadIdx.y; // Calculate global y index

    // Optimize: Calculate linear index and ensure it is within bounds
    int id = y * rectWidth + x;
    if (x < rectWidth && y < rectHeight) {

        int srcPixelX = srcRectX + x;
        int srcPixelY = srcRectY + y;

        int destPixelX = destRectX + x;
        int destPixelY = destRectY + y;

        // Perform the copy
        dest[destOffset + destPixelX + destPixelY * destWidth] = 
            src[srcOffset + srcPixelX + srcPixelY * srcWidth];
    }
}