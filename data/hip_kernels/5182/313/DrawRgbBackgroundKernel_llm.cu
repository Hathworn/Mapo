#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void DrawRgbBackgroundKernel(float *target, int inputWidth, int inputHeight, float r, float g, float b)
{
    int column = threadIdx.x + blockDim.x * blockIdx.z;
    if (column >= inputWidth)
        return;

    int row = blockIdx.x;
    int colorChannel = blockIdx.y;

    // linear index with color channel
    int id = colorChannel * (inputWidth * inputHeight) + row * inputWidth + column;

    if (id < 3 * inputWidth * inputHeight) // Simplified boundary check
    {
        float color;
        // Use conditional operator for compactness
        color = (colorChannel == 0) ? r : (colorChannel == 1) ? g : b;
        target[id] = color;
    }
}