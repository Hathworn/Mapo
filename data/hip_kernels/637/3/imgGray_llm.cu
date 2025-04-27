#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void imgGray(unsigned char * d_image, unsigned char* d_imagegray, int width, int height) {
    // Calculate row and col using block and thread indices
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if indices are within image bounds
    if (col < width && row < height) {
        int idx = row * width + col; // Calculate 1D linear index for the pixel
        int rgb_idx = idx * 3; // Calculate 1D index for the RGB components
        // Convert RGB to grayscale using weighted average
        d_imagegray[idx] = d_image[rgb_idx + 2] * 0.299f + d_image[rgb_idx + 1] * 0.587f + d_image[rgb_idx] * 0.114f;
    }
}