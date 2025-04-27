#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void DrawRgbaColorKernel(float *target, int targetWidth, int targetHeight, int inputX, int inputY, int areaWidth, int areaHeight, float r, float g, float b) {
    // Calculate global thread ID
    int id = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x;

    // Pre-compute useful values
    int targetPixels = targetWidth * targetHeight;
    int texturePixels = areaWidth * areaHeight;

    // Determine RGB channel and texture position
    int idTextureRgb = id / texturePixels;
    if (idTextureRgb < 3) {
        int idTexturePixel = id % texturePixels;
        int idTextureY = idTexturePixel / areaWidth;
        int idTextureX = idTexturePixel % areaWidth;

        // Boundary check for valid position in target
        int targetX = idTextureX + inputX;
        int targetY = idTextureY + inputY;

        if (targetX < targetWidth && targetX >= 0 && targetY < targetHeight && targetY >= 0) {
            // Select color based on channel
            float color = (idTextureRgb == 0) ? r : (idTextureRgb == 1) ? g : b;

            // Calculate target index and assign color
            int tIndex = targetPixels * idTextureRgb + targetWidth * targetY + targetX;
            target[tIndex] = color;
        }
    }
}