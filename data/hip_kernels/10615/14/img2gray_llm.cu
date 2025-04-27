#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void img2gray(unsigned char *imageInput, int width, int height, unsigned char *imageOutput) {
    // Calculate row and col once
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a single if condition for bounds check
    if ((row < height) && (col < width)) {
        int idx = row * width + col;
        int rgb_idx = idx * 3;

        // Improved memory access coalescing and reduced computation redundancy
        unsigned char r = imageInput[rgb_idx + RED];
        unsigned char g = imageInput[rgb_idx + GREEN];
        unsigned char b = imageInput[rgb_idx + BLUE];

        imageOutput[idx] = r * 0.299f + g * 0.587f + b * 0.114f;
    }
}