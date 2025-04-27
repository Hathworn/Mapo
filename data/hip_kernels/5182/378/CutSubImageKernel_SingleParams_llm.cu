```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void CutSubImageKernel_SingleParams(float *input, float *output, float subImageX, float subImageY, float subImageDiameter, bool safeBounds, int inputWidth, int inputHeight, int outputWidth, int outputHeight)
{
    int id = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x;
    int size = outputWidth * outputHeight;

    if (id < size)
    {
        // Cache common calculations
        float subImgCX = subImageX; // <-1, 1>
        float subImgCY = subImageY; // <-1, 1>
        float subImgDiameter = subImageDiameter; // <0, 1>
        int maxDiameter = min(inputWidth - 1, inputHeight - 1);
        int diameterPix = min(max(1, (int)(subImgDiameter * maxDiameter)), maxDiameter);

        int subImgX = (int)(inputWidth * (subImgCX + 1) * 0.5f) - diameterPix / 2;
        int subImgY = (int)(inputHeight * (subImgCY + 1) * 0.5f) - diameterPix / 2;

        // Adjust coordinates if safeBounds is true
        if (safeBounds)
        {
            subImgX = max(1, min(subImgX, inputWidth - diameterPix - 1));
            subImgY = max(1, min(subImgY, inputHeight - diameterPix - 1));
        }

        // Calculate position in subimage
        int px = id % outputWidth;
        int py = id / outputWidth;
        float xRatio = (diameterPix - 1) / (float)(outputWidth - 1);
        float yRatio = (diameterPix - 1) / (float)(outputHeight - 1);
        int x = (int)(xRatio * px);
        int y = (int)(yRatio * py);

        // Bounds check for valid access
        if ((x + subImgX) >= 0 && (y + subImgY) >= 0 && (x + subImgX) < inputWidth && (y + subImgY) < inputHeight)
        {
            output[py * outputWidth + px] = input[(y + subImgY) * inputWidth + (x + subImgX)];
        }
    }
}