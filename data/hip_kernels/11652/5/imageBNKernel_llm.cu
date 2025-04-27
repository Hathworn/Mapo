#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void imageBNKernel(unsigned char* d_image, int h, int w)
{
    int Row = blockIdx.y * blockDim.y + threadIdx.y;
    int Col = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if Row and Col are within image bounds
    if ((Row < h) && (Col < w)) {
        int pixelIndex = 4 * (w * Row + Col); // Calculate pixel index once

        int r = d_image[pixelIndex + 0];
        int g = d_image[pixelIndex + 1];
        int b = d_image[pixelIndex + 2];

        d_image[pixelIndex + 0] = 0; // Set R channel to 0
        d_image[pixelIndex + 1] = 0; // Set G channel to 0
        d_image[pixelIndex + 2] = 0; // Set B channel to 0

        // Convert to grayscale and assign to A channel
        d_image[pixelIndex + 3] = static_cast<unsigned char>(r * 0.21f + g * 0.71f + b * 0.07f);
    }
}