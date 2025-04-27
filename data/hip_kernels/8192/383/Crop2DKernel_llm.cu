#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Crop2DKernel(float *input, float *output, int inputWidth, int inputHeight, int outputWidth, int size, int leftMargin, int topMargin, float fillValue)
{
    // Calculate flattened global index
    int id = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;

    if (id >= size) return; // Exit early if out of bounds

    // Calculate 2D coordinates in the output image
    int outputX = id % outputWidth;
    int outputY = id / outputWidth;

    // Map to 2D coordinates in the input image
    int inputX = outputX - leftMargin;
    int inputY = outputY - topMargin;

    // Check if input coordinates are valid
    if (inputX >= 0 && inputX < inputWidth && inputY >= 0 && inputY < inputHeight)
        output[id] = input[inputX + inputY * inputWidth];
    else
        output[id] = fillValue;
}