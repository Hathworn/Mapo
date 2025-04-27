#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void BilinearAddSubImageKernel(float *input, float *opImage, float* subImageDefs, int inputWidth, int inputHeight, int opImageWidth, int opImageHeight)
{
    // Calculate unique thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;

    // Load sub-image parameters
    float subImgCX = subImageDefs[0];
    float subImgCY = subImageDefs[1];
    float subImgDiameter = subImageDefs[2];

    // Calculate sub-image properties
    int maxDiameter = min(inputWidth, inputHeight);
    int diameterPix = max(1, (int)(subImgDiameter * maxDiameter));
    int subImgX = (int)(inputWidth * (subImgCX + 1) * 0.5f) - diameterPix / 2;
    int subImgY = (int)(inputHeight * (subImgCY + 1) * 0.5f) - diameterPix / 2;

    // Calculate pixel position in the sub-image
    int px = id % diameterPix;
    int py = id / diameterPix;

    // Validate pixel coordinates within the input image bounds
    if (px + subImgX >= 0 && py + subImgY >= 0 &&
        px + subImgX < inputWidth && py + subImgY < inputHeight &&
        py < diameterPix)
    {
        // Bilinear interpolation ratios
        float xRatio = (float)(opImageWidth - 1) / diameterPix;
        float yRatio = (float)(opImageHeight - 1) / diameterPix;

        int x = (int)(xRatio * px);
        int y = (int)(yRatio * py);

        float xDist = (xRatio * px) - x;
        float yDist = (yRatio * py) - y;

        // Bilinear interpolation
        float topLeft = opImage[y * opImageWidth + x];
        float topRight = opImage[y * opImageWidth + x + 1];
        float bottomLeft = opImage[(y + 1) * opImageWidth + x];
        float bottomRight = opImage[(y + 1) * opImageWidth + x + 1];

        float result = 
            topLeft * (1 - xDist) * (1 - yDist) +
            topRight * xDist * (1 - yDist) +
            bottomLeft * yDist * (1 - xDist) +
            bottomRight * xDist * yDist;

        // Add result to input
        atomicAdd(&input[(py + subImgY) * inputWidth + px + subImgX], result); // Use atomicAdd to prevent race conditions
    }
}