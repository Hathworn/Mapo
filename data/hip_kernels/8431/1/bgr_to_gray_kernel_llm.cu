#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bgr_to_gray_kernel(unsigned char* input, unsigned char* output, int width, int height, int colorWidthStep, int grayWidthStep) {
    // Calculate the unique thread ID
    const int xIndex = blockIdx.x * blockDim.x + threadIdx.x;
    const int yIndex = blockIdx.y * blockDim.y + threadIdx.y;

    // Perform computation only if within bounds
    if (xIndex < width && yIndex < height) {
        // Compute single index offset for input and output
        const int color_tid = yIndex * colorWidthStep + (3 * xIndex);
        const int gray_tid = yIndex * grayWidthStep + xIndex;

        // Load BGR values from global memory
        const unsigned char blue = input[color_tid];
        const unsigned char green = input[color_tid + 1];
        const unsigned char red = input[color_tid + 2];

        // Convert BGR to grayscale using NTSC formula
        const float gray = red * 0.3f + green * 0.59f + blue * 0.11f;

        // Store result in output as a grayscale pixel
        output[gray_tid] = static_cast<unsigned char>(gray);
    }
}