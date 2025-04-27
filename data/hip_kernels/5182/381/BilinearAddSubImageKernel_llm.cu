#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void BilinearAddSubImageKernel(float *input, float *opImage, float* subImageDefs, int inputWidth, int inputHeight, int opImageWidth, int opImageHeight)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Simplified ID calculation

    float subImgCX = subImageDefs[0];
    float subImgCY = subImageDefs[1];
    float subImgDiameter = subImageDefs[2];

    int maxDiameter = min(inputWidth, inputHeight);
    int diameterPix = max(1, int(subImgDiameter * maxDiameter));

    int subImgX = int(inputWidth * (subImgCX + 1) * 0.5f) - diameterPix / 2;
    int subImgY = int(inputHeight * (subImgCY + 1) * 0.5f) - diameterPix / 2;

    int px = id % diameterPix;
    int py = id / diameterPix;

    if (px + subImgX >= 0 && py + subImgY >= 0 && px + subImgX < inputWidth && py + subImgY < inputHeight && py < diameterPix)
    {
        float xRatio = float(opImageWidth - 1) / diameterPix;
        float yRatio = float(opImageHeight - 1) / diameterPix;

        int x = int(xRatio * px);
        int y = int(yRatio * py);

        float xDist = (xRatio * px) - x;
        float yDist = (yRatio * py) - y;

        // Access opImage safely with boundary check
        float topLeft = opImage[y * opImageWidth + x];
        float topRight = (x + 1 < opImageWidth) ? opImage[y * opImageWidth + x + 1] : 0.0f;
        float bottomLeft = (y + 1 < opImageHeight) ? opImage[(y + 1) * opImageWidth + x] : 0.0f;
        float bottomRight = (x + 1 < opImageWidth && y + 1 < opImageHeight) ? opImage[(y + 1) * opImageWidth + x + 1] : 0.0f;

        float result = topLeft * (1 - xDist) * (1 - yDist) +
                       topRight * xDist * (1 - yDist) +
                       bottomLeft * yDist * (1 - xDist) +
                       bottomRight * xDist * yDist;

        atomicAdd(&input[(py + subImgY) * inputWidth + px + subImgX], result); // Safely accumulate result
    }
}