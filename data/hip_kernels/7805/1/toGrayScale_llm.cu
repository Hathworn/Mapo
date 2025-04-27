#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void toGrayScale(unsigned char *output, const unsigned char *input, int width, int height, int components)
{
    // Calculate the global thread coordinates
    int column = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;

    // Return if out of image bounds
    if (row >= height || column >= width)
        return;

    // Compute the 1D index for the image data
    int index = (column + row * width) * components;  // Modify index calculation for better readability
    unsigned char greyScale = __fmaf_rn(0.114f, input[index], __fmaf_rn(0.587f, input[index + 1], 0.299f * input[index + 2]));

    // Store the computed gray scale value
    output[column + row * width] = greyScale;
}