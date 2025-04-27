#include "hip/hip_runtime.h"
#include "includes.h"

#define HISTOGRAM_LENGTH 256

__global__ void convertToChar(float *input, unsigned char *ucharInput, int width, int height)
{
    // Calculate global thread position
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;

    // Check boundaries
    if (row < height && col < width)
    {
        int index3 = (row * width + col) * 3;

        // Convert float to unsigned char
        ucharInput[index3]     = __saturatef(input[index3]) * 255;   // r
        ucharInput[index3 + 1] = __saturatef(input[index3 + 1]) * 255; // g
        ucharInput[index3 + 2] = __saturatef(input[index3 + 2]) * 255; // b
    }
}