#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void DrawMaskedColorKernel2DBlock(float *target, int targetWidth, int targetHeight, int inputX, int inputY, float *textureMask, int textureWidth, int textureHeight, float r, float g, float b)
{
    int idTextureRgb = blockIdx.y; // Color channel index
    int idTextureY = blockIdx.x * blockDim.y + threadIdx.y; // Y coordinate in texture
    int idTextureX = threadIdx.x; // X coordinate in texture

    if (idTextureRgb < 3) // Only RGB channels are interesting
    {
        // if the texture pixel offset by inputX, inputY, lies inside the target
        if (idTextureX + inputX < targetWidth &&
            idTextureX + inputX >= 0 &&
            idTextureY + inputY < targetHeight &&
            idTextureY + inputY >= 0)
        {
            int tIndex = targetWidth * targetHeight * idTextureRgb + targetWidth * (idTextureY + inputY) + (idTextureX + inputX);
            int aIndex = idTextureY * textureWidth + idTextureX + 3 * textureWidth * textureHeight; // Optimized alpha index calculation
            float a = textureMask[aIndex];

            if (a > 0) // Mask allows color here
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