#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void BilinearResampleSubImageKernel_ForManyProposals(const float *input, float *output, const float* subImageDefs, bool safeBounds, int subImageDefsDim, int inputWidth, int inputHeight, int outputWidth, int outputHeight, int numberSubImages, int outputSize)
{
    int id = blockDim.x * blockIdx.y * gridDim.x + blockDim.x * blockIdx.x + threadIdx.x;
    if (id >= outputSize) return; // Early exit for out-of-bound threads

    int px = id % outputWidth;  // line in the single output image
    int py = (id / outputWidth) % outputHeight;  // column in the single output image
    int subim_id = id / (outputWidth * outputHeight);  // which image it is

    float subImgCX = subImageDefs[0 + subim_id * subImageDefsDim]; // <-1, 1>
    float subImgCY = subImageDefs[1 + subim_id * subImageDefsDim]; // <-1, 1>
    float subImgDiameter = subImageDefs[2 + subim_id * subImageDefsDim]; // <0,1>

    int maxDiameter = min(inputWidth - 1, inputHeight - 1);
    int diameterPix = (int)(subImgDiameter * maxDiameter);
    diameterPix = max(1, min(maxDiameter, diameterPix)); // Clamp diameterPix within valid bounds

    int subImgX = (int)(inputWidth * (subImgCX + 1) * 0.5f) - diameterPix / 2;
    int subImgY = (int)(inputHeight * (subImgCY + 1) * 0.5f) - diameterPix / 2;

    if (safeBounds)
    {
        subImgX = max(1, min(subImgX, inputWidth - diameterPix - 1));
        subImgY = max(1, min(subImgY, inputHeight - diameterPix - 1));
    }

    float xRatio = (diameterPix - 1) / (float)(outputWidth - 1);
    float yRatio = (diameterPix - 1) / (float)(outputHeight - 1);

    int x = (int)(xRatio * px);
    int y = (int)(yRatio * py);

    if (x + subImgX >= 0 && y + subImgY >= 0 && x + subImgX < inputWidth && y + subImgY < inputHeight)
    {
        //--- X and Y distance difference
        float xDist = (xRatio * px) - x;
        float yDist = (yRatio * py) - y;

        //--- Points
        int baseIndex = (y + subImgY) * inputWidth + x + subImgX;
        float topLeft = input[baseIndex];
        float topRight = input[baseIndex + 1];
        float bottomLeft = input[baseIndex + inputWidth];
        float bottomRight = input[baseIndex + inputWidth + 1];

        float result = topLeft * (1 - xDist) * (1 - yDist) +
                       topRight * xDist * (1 - yDist) +
                       bottomLeft * yDist * (1 - xDist) +
                       bottomRight * xDist * yDist;

        output[py * outputWidth + px + subim_id * outputWidth * outputHeight] = result;
    }
}