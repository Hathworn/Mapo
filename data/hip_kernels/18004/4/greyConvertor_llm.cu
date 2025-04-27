#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void greyConvertor(unsigned char* output, uchar3 const* input, const uint height, const uint width) {
    // Pre-calculate the pixel index using linear thread indexing for better performance
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Check if thread is within the image bounds
    if (x < width && y < height) {
        int grayOffset = y * width + x;
        uchar3 pixel = input[grayOffset];  // Fetch the pixel data once
        // Apply weighted sum for grayscale conversion with float multiplication for precision
        output[grayOffset] = 0.21f * pixel.x + 0.72f * pixel.y + 0.07f * pixel.z;
    }
}