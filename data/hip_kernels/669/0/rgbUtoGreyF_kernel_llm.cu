#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function for better performance
__global__ void rgbUtoGreyF_kernel(int width, int height, unsigned int* rgbU, float* grey) {
    // Calculate the column and row index for the current thread
    int x = blockDim.x * blockIdx.x + threadIdx.x;
    int y = blockDim.y * blockIdx.y + threadIdx.y;

    // Ensure the thread is within image bounds
    if ((x < width) && (y < height)) {
        // Compute the index for 1D array access
        int index = y * width + x;

        // Retrieve RGB value and extract individual channels
        unsigned int rgb = rgbU[index];
        float r = (rgb & 0xff) * 0.29894f / 255.0f;
        float g = ((rgb & 0xff00) >> 8) * 0.58704f / 255.0f;
        float b = ((rgb & 0xff0000) >> 16) * 0.11402f / 255.0f;

        // Calcualte grayscale value using weighted sum
        grey[index] = r + g + b;
    }
}