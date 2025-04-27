#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void rgb2gray(float *grayImage, float *rgbImage, int channels, int width, int height) {
    int x = threadIdx.x + blockIdx.x * blockDim.x;
    int y = threadIdx.y + blockIdx.y * blockDim.y;

    // Ensure thread is within image bounds
    if (x < width && y < height) {
        // Compute 1D coordinate for the grayscale image
        int grayOffset = y * width + x;
        int rgbOffset = grayOffset * channels;

        // Cache RGB values to registers for faster access
        float r = rgbImage[rgbOffset];     
        float g = rgbImage[rgbOffset + 1];
        float b = rgbImage[rgbOffset + 2];

        // Convert and store grayscale value
        grayImage[grayOffset] = 0.21f * r + 0.71f * g + 0.07f * b;
    }
}