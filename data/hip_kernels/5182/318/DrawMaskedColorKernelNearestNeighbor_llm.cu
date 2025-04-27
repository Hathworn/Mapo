#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void DrawMaskedColorKernelNearestNeighbor(float *target, int targetWidth, int targetHeight, int inputX, int inputY, float *texture, int textureWidth, int textureHeight, int objectWidth, int objectHeight, float r, float g, float b )
{
    int id = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x;
    int targetPixels = targetWidth * targetHeight;
    int objectPixels = objectWidth * objectHeight;
    
    int idObjectRgb = id / objectPixels;
    if (idObjectRgb >= 3) return; // Early exit if not within RGB range

    int idObjectPixel = id % objectPixels;
    int idObjectY = idObjectPixel / objectWidth;
    int idObjectX = idObjectPixel % objectWidth;

    int targetRgb = idObjectRgb;
    switch (idObjectRgb) {
        case 0: targetRgb = 2; break; // R to B
        case 2: targetRgb = 0; break; // B to R
    }

    int targetX = idObjectX + inputX;
    int targetY = idObjectY + inputY;
    if (targetX < targetWidth && targetX >= 0 && targetY < targetHeight && targetY >= 0) {
        int textureX = textureWidth * idObjectX / objectWidth;
        int textureY = textureHeight * idObjectY / objectHeight;
        int textureId = textureY * textureWidth + textureX;

        int aIndex = textureId + 3 * textureWidth * textureHeight; // A component index
        float a = texture[aIndex];
        
        if (a > 0) {
            int tIndex = targetPixels * targetRgb + targetWidth * targetY + targetX;
            float color = (idObjectRgb == 0) ? r : ((idObjectRgb == 1) ? g : b); // Select color component
            target[tIndex] = target[tIndex] * (1.0f - a) + a * color;
        }
    }
}