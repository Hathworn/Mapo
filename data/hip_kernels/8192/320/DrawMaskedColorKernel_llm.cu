#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void DrawMaskedColorKernel(float *target, int targetWidth, int targetHeight, int inputX, int inputY, float *textureMask, int textureWidth, int textureHeight, float r, float g, float b)
{
    // Calculate the global thread index
    int id = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x;

    int texturePixels = textureWidth * textureHeight;
    int idTextureRgb = id / texturePixels;
    
    if (idTextureRgb < 3) // Process only RGB channels
    {
        int idTexturePixel = id % texturePixels; // Use modulo for cleaner code
        int idTextureY = idTexturePixel / textureWidth;
        int idTextureX = idTexturePixel % textureWidth;

        // Check bounds with input offsets
        if (idTextureX + inputX < targetWidth && idTextureX + inputX >= 0 &&
            idTextureY + inputY < targetHeight && idTextureY + inputY >= 0)
        {
            int targetIndex = (idTextureRgb * targetHeight + (idTextureY + inputY)) * targetWidth + (idTextureX + inputX);
            int alphaIndex = idTexturePixel + 3 * texturePixels; // A channel index
            float alpha = textureMask[alphaIndex];

            if (alpha > 0) // Apply mask
            {
                switch (idTextureRgb)
                {
                    case 0:
                        target[targetIndex] = r;
                        break;
                    case 1:
                        target[targetIndex] = g;
                        break;
                    case 2:
                        target[targetIndex] = b;
                        break;
                }
            }
        }
    }
}
```
