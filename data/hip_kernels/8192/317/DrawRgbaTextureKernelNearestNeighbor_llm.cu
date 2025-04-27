#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void DrawRgbaTextureKernelNearestNeighbor(float *target, int targetWidth, int targetHeight, int inputX, int inputY, float *texture, int textureWidth, int textureHeight, int objectWidth, int objectHeight)
{
    int id = blockDim.x * blockIdx.y * gridDim.x
           + blockDim.x * blockIdx.x
           + threadIdx.x;

    int idObjectRgb = id / (objectWidth * objectHeight);
    int idObjectPixel = id % (objectWidth * objectHeight); // Optimized modulo operation
    int idObjectY = idObjectPixel / objectWidth;
    int idObjectX = idObjectPixel % objectWidth; // Optimized modulo operation

    if (idObjectRgb < 3) // 3 channels to write to (R, G, B)
    {
        int targetRgb = (idObjectRgb == 0) ? 2 : (idObjectRgb == 2) ? 0 : 1;

        // Check if the projected object pixel lies within target bounds
        if (idObjectX + inputX < targetWidth && idObjectX + inputX >= 0 &&
            idObjectY + inputY < targetHeight && idObjectY + inputY >= 0)
        {
            // Compute nearest neighbor coordinates
            int textureX = textureWidth * idObjectX / objectWidth;
            int textureY = textureHeight * idObjectY / objectHeight;
            int textureId = textureY * textureWidth + textureX;

            float textureValue = texture[textureId + idObjectRgb * textureWidth * textureHeight];

            int tIndex = targetWidth * targetHeight * targetRgb + targetWidth * (idObjectY + inputY) + (idObjectX + inputX);
            float a = texture[textureId + 3 * textureWidth * textureHeight];
            target[tIndex] = target[tIndex] * (1.0f - a) + a * textureValue;
        }
    }
}