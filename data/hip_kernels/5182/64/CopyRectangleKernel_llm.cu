#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void CopyRectangleKernel(float *src, int srcOffset, int srcWidth, int srcRectX, int srcRectY, int rectWidth, int rectHeight, float *dest, int destOffset, int destWidth, int destRectX, int destRectY)
{
    // Calculate the 2D thread location in grid
    int localX = blockIdx.x * blockDim.x + threadIdx.x;
    int localY = blockIdx.y * blockDim.y + threadIdx.y;

    // Check if within rectangle bounds
    if (localX < rectWidth && localY < rectHeight) {
        // Calculate source and destination positions
        int srcPixelX = srcRectX + localX;
        int srcPixelY = srcRectY + localY;
        int destPixelX = destRectX + localX;
        int destPixelY = destRectY + localY;

        // Perform the copy
        (dest + destOffset)[destPixelX + destPixelY * destWidth] = (src + srcOffset)[srcPixelX + srcPixelY * srcWidth];
    }
}