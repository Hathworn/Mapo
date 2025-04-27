#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void DrawMaskedColorKernelNearestNeighbor(float *target, int targetWidth, int targetHeight, int inputX, int inputY, float *texture, int textureWidth, int textureHeight, int objectWidth, int objectHeight, float r, float g, float b)
{
    int id = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x;

    int targetPixels = targetWidth * targetHeight;
    int texturePixels = textureWidth * textureHeight;
    int objectPixels = objectWidth * objectHeight;

    // Calculate object RGB and pixel index
    int idObjectRgb = id / objectPixels;
    int idObjectPixel = id % objectPixels;
    int idObjectY = idObjectPixel / objectWidth;
    int idObjectX = idObjectPixel % objectWidth;

    if (idObjectRgb < 3) 
    {
        // Calculate target RGB component
        int targetRgb = (idObjectRgb == 0) ? 2 : ((idObjectRgb == 2) ? 0 : 1);

        // Check boundary conditions
        if (idObjectX + inputX < targetWidth && idObjectX + inputX >= 0 &&
            idObjectY + inputY < targetHeight && idObjectY + inputY >= 0)
        {
            // Compute nearest neighbor texture coordinates
            int textureX = textureWidth * idObjectX / objectWidth;
            int textureY = textureHeight * idObjectY / objectHeight;
            int textureId = textureY * textureWidth + textureX;
            int aIndex = textureId + 3 * texturePixels;

            float a = texture[aIndex];

            if (a > 0) 
            {
                int tIndex = targetPixels * targetRgb + targetWidth * (idObjectY + inputY) + (idObjectX + inputX);

                // Apply color blending
                target[tIndex] = target[tIndex] * (1.0f - a);

                switch (idObjectRgb)
                {
                case 0:
                    target[tIndex] += a * r;
                    break;
                case 1:
                    target[tIndex] += a * g;
                    break;
                case 2:
                    target[tIndex] += a * b;
                    break;
                }
            }
        }
    }
}
```
