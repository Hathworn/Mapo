#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ExactResampleKernel_Nto1(float *input, float *output, int inputWidth, int inputHeight, int outputWidth, int outputHeight)
{
    int id = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x; // Simplified id calculation
    int size = outputWidth * outputHeight;

    if (id < size)
    {
        int px = id % outputWidth;
        int py = id / outputWidth;

        int xRatio = inputWidth / outputWidth;
        int yRatio = inputHeight / outputHeight;

        float sum = 0.0f; // Use 0.0f for float precision

        int startX = px * xRatio;
        int startY = py * yRatio;
        
        for (int sx = 0; sx < xRatio; sx++)
        {
            for (int sy = 0; sy < yRatio; sy++)
            {
                int x = startX + sx; // Pre-calculate start indices
                int y = startY + sy;

                sum += input[y * inputWidth + x];
            }
        }

        output[py * outputWidth + px] = sum / (xRatio * yRatio); // Remove redundant float casting
    }
}