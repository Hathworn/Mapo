```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void DrawMaskedColorKernel(float *target, int targetWidth, int targetHeight, int inputX, int inputY, float *textureMask, int textureWidth, int textureHeight, float r, float g, float b) 
{
    int id = blockDim.x * blockIdx.y * gridDim.x
           + blockDim.x * blockIdx.x
           + threadIdx.x;

    int targetPixels = targetWidth * targetHeight;
    int texturePixels = textureWidth * textureHeight;

    int idTextureRgb = id / texturePixels;
    int idTexturePixel = id % texturePixels; // Optimized to use modulus directly
    int idTextureY = idTexturePixel / textureWidth;
    int idTextureX = idTexturePixel % textureWidth; // Optimized to use modulus directly

    // Only process RGB channels
    if (idTextureRgb < 3) 
    {
        int offsetX = idTextureX + inputX;
        int offsetY = idTextureY + inputY;

        // Check if within target bounds
        if (offsetX < targetWidth && offsetX >= 0 && offsetY < targetHeight && offsetY >= 0) 
        {
            int tIndex = targetPixels * idTextureRgb + targetWidth * offsetY + offsetX;
            int aIndex = idTexturePixel + 3 * texturePixels; // The A component of the texture
            float a = textureMask[aIndex];

            // Only process if mask allows
            if (a > 0) 
            {
                if (idTextureRgb == 0) 
                {
                    target[tIndex] = r;
                }
                else if (idTextureRgb == 1) 
                {
                    target[tIndex] = g;
                }
                else // idTextureRgb == 2
                {
                    target[tIndex] = b;
                }
            }
        }
    }
}