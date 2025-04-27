#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void DrawRgbBackgroundKernel(float *target, int inputWidth, int inputHeight, float r, float g, float b)
{
    int column = threadIdx.x + blockDim.x * blockIdx.z;
    if (column >= inputWidth) return; // Early exit if column out of bounds

    int row = blockIdx.x; // Use blockIdx.x for row
    int colorChannel = blockIdx.y; // Use blockIdx.y for color channel
    int imagePixels = inputWidth * inputHeight;
    int id = column + row * inputWidth + colorChannel * imagePixels; // Calculate id with rearranged operations

    if (id < 3 * imagePixels)
    {
        float color = (colorChannel == 0) ? r : (colorChannel == 1) ? g : b; // Use conditional operator for color
        target[id] = color;
    }
}