#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void DrawRgbaColorKernel(float *target, int targetWidth, int targetHeight, int inputX, int inputY, int areaWidth, int areaHeight, float r, float g, float b)
{
    int id = blockDim.x * blockIdx.y * gridDim.x
           + blockDim.x * blockIdx.x
           + threadIdx.x;

    int targetPixels = targetWidth * targetHeight;
    int texturePixels = areaWidth * areaHeight;

    int idTextureRgb = id / texturePixels;
    int idTexturePixel = id % texturePixels; // simplified modulus operation
    int idTextureY = idTexturePixel / areaWidth;
    int idTextureX = idTexturePixel % areaWidth;

    if (idTextureRgb < 3) // Optimized condition check
    {
        int posX = idTextureX + inputX; // precompute frequently used value
        int posY = idTextureY + inputY;

        if (posX < targetWidth && posX >= 0 && posY < targetHeight && posY >= 0)
        {
            float color;
            if (idTextureRgb == 0)
                color = r;
            else if (idTextureRgb == 1)
                color = g;
            else
                color = b;

            int tIndex = targetPixels * idTextureRgb + targetWidth * posY + posX;
            target[tIndex] = color;
        }
    }
}