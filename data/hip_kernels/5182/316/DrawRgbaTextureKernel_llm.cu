#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void DrawRgbaTextureKernel(float *target, int targetWidth, int targetHeight, int inputX, int inputY, float *texture, int textureWidth, int textureHeight)
{
    // Calculate the unique identifier for each thread
    int id = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x;

    // Precompute number of pixels
    int targetPixels = targetWidth * targetHeight;
    int texturePixels = textureWidth * textureHeight;

    // Calculate the texture channel and pixel position
    int idTextureRgb = id / texturePixels;
    int idTexturePixel = id % texturePixels; // Use modulus instead for clarity
    int idTextureY = idTexturePixel / textureWidth;
    int idTextureX = idTexturePixel % textureWidth; // Likewise use modulus here 

    if (idTextureRgb < 3) // Only process R, G, B channels
    {
        // Swap channels from BGR to RGB
        if (idTextureRgb == 0) idTextureRgb = 2; // Swap R <-> B
        else if (idTextureRgb == 2) idTextureRgb = 0;

        // Continue only if the calculated position is within the target bounds
        if (idTextureX + inputX < targetWidth &&
            idTextureX + inputX >= 0 &&
            idTextureY + inputY < targetHeight &&
            idTextureY + inputY >= 0)
        {
            int tIndex = targetPixels * idTextureRgb + targetWidth * (idTextureY + inputY) + (idTextureX + inputX);
            int aIndex = idTexturePixel + 3 * texturePixels; // Calculate alpha component index

            float a = texture[aIndex];
            target[tIndex] = target[tIndex] * (1.0f - a) + a * texture[id];
        }
    }
}