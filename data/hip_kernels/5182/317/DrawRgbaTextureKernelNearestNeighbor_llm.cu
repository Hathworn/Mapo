#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void DrawRgbaTextureKernelNearestNeighbor(float *target, int targetWidth, int targetHeight, 
                                                    int inputX, int inputY, float *texture, 
                                                    int textureWidth, int textureHeight, 
                                                    int objectWidth, int objectHeight)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Optimize id calculation
    int objectPixels = objectWidth * objectHeight;
    
    int idObjectRgb = id / objectPixels;
    int idObjectPixel = id % objectPixels; // Simplified modulo calculation
    int idObjectY = idObjectPixel / objectWidth;
    int idObjectX = idObjectPixel % objectWidth; // Simplified modulo calculation

    if (idObjectRgb < 3) // 3 channels that we will write to
    {
        int targetRgb = (idObjectRgb == 0) ? 2 : (idObjectRgb == 2 ? 0 : 1); // Inline channel mapping

        if (idObjectX + inputX < targetWidth && idObjectX + inputX >= 0 && 
            idObjectY + inputY < targetHeight && idObjectY + inputY >= 0)
        {
            int textureX = textureWidth * idObjectX / objectWidth; // Direct integer division
            int textureY = textureHeight * idObjectY / objectHeight; // Direct integer division
            int textureId = textureY * textureWidth + textureX;

            float textureValue = texture[textureId + idObjectRgb * (textureWidth * textureHeight)]; // Inline multiplication
            int tIndex = (targetWidth * (idObjectY + inputY) + (idObjectX + inputX)) + idObjectRgb * (targetWidth * targetHeight);

            float a = texture[textureId + 3 * (textureWidth * textureHeight)]; // Inline multiplication
            target[tIndex] = target[tIndex] * (1.0f - a) + a * textureValue;
        }
    }
}