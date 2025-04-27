#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void CutSubImageKernel_SingleParams(float *input, float *output, float subImageX, float subImageY, float subImageDiameter, bool safeBounds, int inputWidth, int inputHeight, int outputWidth, int outputHeight)
{
    int id = blockDim.x * blockIdx.y * gridDim.x + blockDim.x * blockIdx.x + threadIdx.x;
    int size = outputWidth * outputHeight;

    if (id < size)
    {
        // Pre-calculate constants that do not change
        float subImgCX = subImageX; // <-1, 1>
        float subImgCY = subImageY; // <-1, 1>
        int maxDiameter = min(inputWidth - 1, inputHeight - 1);
        int diameterPix = max(1, min((int)(subImageDiameter * maxDiameter), maxDiameter));
        int subImgX = (int)(inputWidth * (subImgCX + 1) * 0.5f) - diameterPix / 2;
        int subImgY = (int)(inputHeight * (subImgCY + 1) * 0.5f) - diameterPix / 2;

        if (safeBounds)
        {
            subImgX = max(subImgX, 1);
            subImgY = max(subImgY, 1);
            subImgX = min(subImgX, inputWidth - diameterPix - 1);
            subImgY = min(subImgY, inputHeight - diameterPix - 1);
        }

        int px = id % outputWidth;
        int py = id / outputWidth;
        // Use float division only once
        float xRatio = ((float)(diameterPix - 1)) / (outputWidth - 1);
        float yRatio = ((float)(diameterPix - 1)) / (outputHeight - 1);

        int x = (int)(xRatio * px);
        int y = (int)(yRatio * py);

        // Check bounds before accessing the input
        if (x + subImgX >= 0 && y + subImgY >= 0 && x + subImgX < inputWidth && y + subImgY < inputHeight)
        {
            output[py * outputWidth + px] = input[(y + subImgY) * inputWidth + x + subImgX];
        }
    }
}