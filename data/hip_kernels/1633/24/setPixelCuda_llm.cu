#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setPixelCuda(uint8_t *in, uint32_t rowSize, uint32_t width, uint32_t height, uint32_t *pointX, uint32_t *pointY, uint32_t pointSize, uint32_t value) {
    // Calculate global thread ID
    const uint32_t idPoint = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if idPoint is within bounds
    if (idPoint < pointSize) {
        const uint32_t x = pointX[idPoint];
        const uint32_t y = pointY[idPoint];

        // Ensure pixel position is valid before writing value
        if (x < width && y < height) {
            in[y * rowSize + x] = value;
        }
    }
}