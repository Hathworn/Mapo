#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void BilinearResampleSubImageKernel_ForManyProposals(const float *input, float *output, const float* subImageDefs, bool safeBounds, int subImageDefsDim, int inputWidth, int inputHeight, int outputWidth, int outputHeight, int numberSubImages, int outputSize)
{
    int id = blockDim.x * blockIdx.x + threadIdx.x; // Simplify ID calculation

    if (id < outputSize)
    {
        int subim_id = id / (outputWidth * outputHeight);
        int idx = id % (outputWidth * outputHeight);
        int py = idx / outputWidth;  
        int px = idx % outputWidth;  

        float subImgCX = subImageDefs[subim_id * subImageDefsDim];
        float subImgCY = subImageDefs[1 + subim_id * subImageDefsDim];
        float subImgDiameter = subImageDefs[2 + subim_id * subImageDefsDim];

        int maxDiameter = min(inputWidth - 1, inputHeight - 1);
        int diameterPix = max(1, min(maxDiameter, (int)(subImgDiameter * maxDiameter)));

        int subImgX = (int)(inputWidth * (subImgCX + 1) * 0.5f) - diameterPix / 2;
        int subImgY = (int)(inputHeight * (subImgCY + 1) * 0.5f) - diameterPix / 2;

        if (safeBounds)
        {
            subImgX = max(subImgX, 1);
            subImgY = max(subImgY, 1);
            subImgX = min(subImgX, inputWidth - diameterPix - 1);
            subImgY = min(subImgY, inputHeight - diameterPix - 1);
        }

        float xRatio = (float)(diameterPix - 1) / (outputWidth - 1);
        float yRatio = (float)(diameterPix - 1) / (outputHeight - 1);

        float xDist, yDist;
        int x = (int)(xRatio * px);
        int y = (int)(yRatio * py);
        
        if ((x + subImgX) >= 0 && (y + subImgY) >= 0 && (x + subImgX) < inputWidth && (y + subImgY) < inputHeight)
        {
            xDist = (xRatio * px) - x;
            yDist = (yRatio * py) - y;

            float topLeft = input[(y + subImgY) * inputWidth + x + subImgX];
            float topRight = input[(y + subImgY) * inputWidth + x + subImgX + 1];
            float bottomLeft = input[(y + subImgY + 1) * inputWidth + x + subImgX];
            float bottomRight = input[(y + subImgY + 1) * inputWidth + x + subImgX + 1];

            float result = topLeft * (1 - xDist) * (1 - yDist) +
                           topRight * xDist * (1 - yDist) +
                           bottomLeft * yDist * (1 - xDist) +
                           bottomRight * xDist * yDist;

            output[py * outputWidth + px + subim_id * outputWidth * outputHeight] = result;
        }
    }
}