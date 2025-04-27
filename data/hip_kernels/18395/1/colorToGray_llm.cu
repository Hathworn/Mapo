#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void colorToGray(unsigned char *input, unsigned char *output, int height, int width)
{
    int col = blockDim.x * blockIdx.x + threadIdx.x;
    int row = blockDim.y * blockIdx.y + threadIdx.y;

    // Precompute the fixed scale factors for each channel.
    constexpr float rScale = 0.299f;
    constexpr float gScale = 0.587f;
    constexpr float bScale = 0.114f;

    if (row < height && col < width)
    {
        int pixelIndex = row * width + col;

        // Use direct indexing to streamline operations.
        int rgbIndex = pixelIndex * 3;
        unsigned char r = input[rgbIndex];
        unsigned char g = input[rgbIndex + 1];
        unsigned char b = input[rgbIndex + 2];

        // Compute grayscale value using precomputed scale factors.
        output[pixelIndex] = static_cast<unsigned char>(r * rScale + g * gScale + b * bScale);
    }
}