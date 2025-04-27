#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void img2gray(unsigned char *imageInput, int width, int height, unsigned char *imageOutput) {
    // Calculate row and col using thread and block indices
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure within bounds
    if (row < height && col < width) {
        // Calculate pixel position
        int pos = (row * width + col) * Channels;
        
        // Convert pixel to grayscale using fixed point arithmetic
        imageOutput[row * width + col] = 
            static_cast<unsigned char>(
                (__float2uint_rz(imageInput[pos + RED] * 77) +  // 0.299 * 256 = 76.544 (approx 77)
                 __float2uint_rz(imageInput[pos + GREEN] * 150) +  // 0.587 * 256 = 150.272 (approx 150)
                 __float2uint_rz(imageInput[pos + BLUE] * 29)) >> 8); // 0.114 * 256 = 29.184 (approx 29)
    }
}