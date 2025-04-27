#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void DrawRgbaTextureKernel2DBlock(float *target, int targetWidth, int targetHeight, int inputX, int inputY, float *texture, int textureWidth, int textureHeight)
{
    int blockId = blockIdx.y * gridDim.x + blockIdx.x;
    int threadId = threadIdx.y * blockDim.x + threadIdx.x;
    int id = blockDim.x * blockDim.y * blockId + threadId;

    int idTextureRgb = blockIdx.y;
    int idTexturePixel = threadId;
    int idTextureY = blockIdx.x * blockDim.y + threadIdx.y;
    int idTextureX = threadIdx.x;

    if (idTextureRgb < 3) // 3 channels that we will write to
    {
        // the texture is in BGR format, we want RGB
        idTextureRgb = (idTextureRgb == 0) ? 2 : (idTextureRgb == 2) ? 0 : idTextureRgb;

        // if the texture pixel offset by inputX, inputY, lies inside the target
        if (idTextureX + inputX < targetWidth &&
            idTextureX + inputX >= 0 &&
            idTextureY + inputY < targetHeight &&
            idTextureY + inputY >= 0)
        {
            int targetPixels = targetWidth * targetHeight;
            int texturePixels = textureWidth * textureHeight;
            int tIndex = targetPixels * idTextureRgb + targetWidth * (idTextureY + inputY) + (idTextureX + inputX);
            int aIndex = idTexturePixel + 3 * texturePixels; // the A component of the texture
            float a = texture[aIndex];
            target[tIndex] = target[tIndex] * (1.0f - a) + a * texture[id];
        }
    }
}