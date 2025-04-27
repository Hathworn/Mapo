#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void toGrayScale(unsigned char *output, unsigned char *input, int width, int height, int components)
{
    // Cache the block index calculations.
    int column = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;

    if (row < height && column < width)  // Combined bounds check for early return.
    {
        int index = column + row * width;
        unsigned char *threadData = input + components * index;
        
        // Reorganize reads, compute greyScale directly.
        unsigned char greyScale = 0.114f * threadData[0] + 0.587f * threadData[1] + 0.299f * threadData[2];

        output[index] = greyScale;  // Direct access using index, eliminating additional pointer arithmetic.
    }
}