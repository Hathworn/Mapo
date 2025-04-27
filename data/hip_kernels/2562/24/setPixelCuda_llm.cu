#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel function to set pixel value
__global__ void setPixelCuda(uint8_t *in, uint32_t rowSize, uint32_t width, uint32_t height, uint32_t *pointX, uint32_t *pointY, uint32_t pointSize, uint32_t value) {
    // Calculate unique global thread ID
    const uint32_t idPoint = blockIdx.x * blockDim.x + threadIdx.x;

    // Perform calculations only if the thread ID is within valid range
    if (idPoint < pointSize) {
        // Cache x and y coordinates in registers
        const uint32_t x = __ldg(&pointX[idPoint]);
        const uint32_t y = __ldg(&pointY[idPoint]);

        // Check if the pixel is within the image bounds
        if (x < width && y < height) {
            // Set the pixel value
            in[y * rowSize + x] = value;
        }
    }
}