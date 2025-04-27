#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void erosion(uint8_t *inData, uint8_t *outData, int radiusX, int radiusY, int width, int height)
{
    int gx = blockIdx.x * blockDim.x + threadIdx.x;
    int gy = blockIdx.y * blockDim.y + threadIdx.y;
    
    if (gx >= width || gy >= height) { // Early exit for out-of-bound threads
        return;
    }

    int x1 = max(0, gx - radiusX);        // Clamp x1 to 0
    int x2 = min(width - 1, gx + radiusX); // Clamp x2 to width - 1
    int y1 = max(0, gy - radiusY);        // Clamp y1 to 0
    int y2 = min(height - 1, gy + radiusY); // Clamp y2 to height - 1

    uint8_t minimum = 255;

    for (int y = y1; y <= y2; ++y) {
        for (int x = x1; x <= x2; ++x) {
            minimum = min(minimum, inData[width * y + x]);
        }
    }

    outData[width * gy + gx] = minimum;
}