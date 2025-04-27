#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void DrawMaskedColorKernel2DBlock(float *target, int targetWidth, int targetHeight, int inputX, int inputY, float *textureMask, int textureWidth, int textureHeight, float r, float g, float b)
{
    // Calculate global thread indices for 2D blocks
    int idTextureX = blockIdx.x * blockDim.x + threadIdx.x;
    int idTextureY = blockIdx.y * blockDim.y + threadIdx.y;

    // Only process pixels within the texture dimensions
    if (idTextureX < textureWidth && idTextureY < textureHeight) 
    {
        // Compute texture RGB channel index and target index offset
        int idTextureRgb = blockIdx.z;
        int texturePixels = textureWidth * textureHeight;
        int targetPixels = targetWidth * targetHeight;
        int tIndex = targetPixels * idTextureRgb + targetWidth * (idTextureY + inputY) + (idTextureX + inputX);
        int aIndex = idTextureY * textureWidth + idTextureX + 3 * texturePixels; // A component index

        // Check bounds and alpha mask value
        if (idTextureRgb < 3 && idTextureX + inputX < targetWidth && idTextureX + inputX >= 0 && 
            idTextureY + inputY < targetHeight && idTextureY + inputY >= 0) 
        {
            float a = textureMask[aIndex];
            if (a > 0) 
            {
                switch (idTextureRgb)
                {
                    case 0:
                        target[tIndex] = r;
                        break;
                    case 1:
                        target[tIndex] = g;
                        break;
                    case 2:
                        target[tIndex] = b;
                        break;
                }
            }
        }
    }
}