#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void DrawRgbaTextureKernel2DBlock(float *target, int targetWidth, int targetHeight, int inputX, int inputY, float *texture, int textureWidth, int textureHeight)
{
    // Using 1D flattened thread ID for better control and coordination
    int id = threadIdx.x + blockDim.x * (threadIdx.y + blockDim.y * blockIdx.y + gridDim.y * blockIdx.x);

    int targetPixels = targetWidth * targetHeight;

    int texturePixels = textureWidth * textureHeight;

    int idGlobal = id / texturePixels;
    int idTexturePixel = id % texturePixels;

    if (idGlobal < 3) // Process within RGB channels
    {
        int idTextureY = idTexturePixel / textureWidth;
        int idTextureX = idTexturePixel % textureWidth;

        // BGR to RGB channel flip
        int channel = idGlobal == 0 ? 2 : (idGlobal == 2 ? 0 : 1);

        // Ensure texture coordinates are within target bounds
        if (idTextureX + inputX < targetWidth &&
            idTextureX + inputX >= 0 &&
            idTextureY + inputY < targetHeight &&
            idTextureY + inputY >= 0)
        {
            int tIndex = targetPixels * channel + targetWidth * (idTextureY + inputY) + (idTextureX + inputX);
            int aIndex = idTexturePixel + 3 * texturePixels; // A component index
            float a = texture[aIndex];

            // Blending texture color over target color
            target[tIndex] = target[tIndex] * (1.0f - a) + a * texture[id];
        }
    }
}