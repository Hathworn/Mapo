#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void BilinearResampleSubImageKernel(float *input, float *output, float* subImageDefs, bool safeBounds, int inputWidth, int inputHeight, int outputWidth, int outputHeight)
{
    int id = blockDim.x * blockIdx.y * gridDim.x + blockDim.x * blockIdx.x + threadIdx.x;
    int size = outputWidth * outputHeight;

    if (id < size)
    {
        float subImgCX = subImageDefs[0]; // <-1, 1>
        float subImgCY = subImageDefs[1]; // <-1, 1>
        float subImgDiameter = subImageDefs[2]; // <0,1>

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

        int px = id % outputWidth;
        int py = id / outputWidth;

        float xRatio = (float)(diameterPix - 1) / (outputWidth - 1);
        float yRatio = (float)(diameterPix - 1) / (outputHeight - 1);

        // Calculate x and y only once
        int x = (int)(xRatio * px);
        int y = (int)(yRatio * py);

        if (x + subImgX >= 0 && y + subImgY >= 0 &&
            x + subImgX < inputWidth && y + subImgY < inputHeight)
        {
            // X and Y distance difference
            float xDist = (xRatio * px) - x;
            float yDist = (yRatio * py) - y;

            // Points with boundary checks removed
            int baseIndex = (y + subImgY) * inputWidth + x + subImgX;
            float topLeft = input[baseIndex];
            float topRight = input[baseIndex + 1];
            float bottomLeft = input[baseIndex + inputWidth];
            float bottomRight = input[baseIndex + inputWidth + 1];

            // Bilinear interpolation
            float result = topLeft * (1 - xDist) * (1 - yDist) +
                           topRight * xDist * (1 - yDist) +
                           bottomLeft * yDist * (1 - xDist) +
                           bottomRight * xDist * yDist;

            output[py * outputWidth + px] = result;
        }
    }
}