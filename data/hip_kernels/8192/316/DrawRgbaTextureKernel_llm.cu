#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void DrawRgbaTextureKernel(float *target, int targetWidth, int targetHeight, int inputX, int inputY, float *texture, int textureWidth, int textureHeight)
{
  int id = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x;

  int texturePixels = textureWidth * textureHeight;

  // Calculate texture RGB and pixel indices
  int idTextureRgb = id / texturePixels;
  int idTexturePixel = id % texturePixels;
  int idTextureY = idTexturePixel / textureWidth;
  int idTextureX = idTexturePixel % textureWidth;

  if (idTextureRgb < 3) // Only process RGB channels
  {
    // Switch from BGR to RGB
    idTextureRgb = (idTextureRgb == 0) ? 2 : (idTextureRgb == 2) ? 0 : 1;

    // Check if pixel position is within target boundaries
    if (idTextureX + inputX < targetWidth &&
        idTextureX + inputX >= 0 &&
        idTextureY + inputY < targetHeight &&
        idTextureY + inputY >= 0)
    {
      int tIndex = (idTextureRgb * targetWidth * targetHeight) + (targetWidth * (idTextureY + inputY)) + (idTextureX + inputX);
      int aIndex = idTexturePixel + 3 * texturePixels; // Alpha channel index
      float a = texture[aIndex];
      
      // Blend texture into target
      target[tIndex] = target[tIndex] * (1.0f - a) + a * texture[id];
    }
  }
}