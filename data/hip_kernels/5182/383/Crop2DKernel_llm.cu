#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Crop2DKernel(float *input, float *output, int inputWidth, int inputHeight, int outputWidth, int size, int leftMargin, int topMargin, float fillValue)
{
    // Compute global thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;

    if (id < size)
    {
        // Calculate input coordinates
        int inputX = id % outputWidth - leftMargin;
        int inputY = id / outputWidth - topMargin;

        // Check coordinate validity and assign value
        if (inputX >= 0 && inputX < inputWidth && inputY >= 0 && inputY < inputHeight)
            output[id] = input[inputX + inputY * inputWidth];
        else
            output[id] = fillValue;
    }
}