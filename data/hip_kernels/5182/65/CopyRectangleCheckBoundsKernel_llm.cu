#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void CopyRectangleCheckBoundsKernel(float *src, int srcOffset, int srcWidth, int srcHeight, int srcRectX, int srcRectY, int rectWidth, int rectHeight, float *dest, int destOffset, int destWidth, int destRectX, int destRectY, float defaultValue)
{
    // Calculate unique thread ID
    int id = blockIdx.y * gridDim.x * blockDim.x + blockIdx.x * blockDim.x + threadIdx.x;

    // Pre-calculate total size
    int size = rectWidth * rectHeight;

    // Only process if id is within bounds
    if (id < size) {
        // Determine local x and y positions within the rectangle
        int localX = id % rectWidth;
        int localY = id / rectWidth;

        // Calculate source and destination pixel positions
        int srcPixelX = srcRectX + localX;
        int srcPixelY = srcRectY + localY;
        int destPixelX = destRectX + localX;
        int destPixelY = destRectY + localY;

        // Check if source pixel is within valid bounds
        if (srcPixelX >= 0 && srcPixelX < srcWidth && srcPixelY >= 0 && srcPixelY < srcHeight) {
            dest[destOffset + destPixelX + destPixelY * destWidth] = src[srcOffset + srcPixelX + srcPixelY * srcWidth];
        } else {
            dest[destOffset + destPixelX + destPixelY * destWidth] = defaultValue;
        }
    }
}