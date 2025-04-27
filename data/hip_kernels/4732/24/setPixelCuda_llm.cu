```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setPixelCuda(uint8_t *in, uint32_t rowSize, uint32_t width, uint32_t height, uint32_t *pointX, uint32_t *pointY, uint32_t pointSize, uint32_t value)
{
    // Calculate unique global index for each thread
    uint32_t idPoint = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the thread processes only valid data
    if (idPoint < pointSize) 
    {
        uint32_t x = pointX[idPoint];
        uint32_t y = pointY[idPoint];

        // Validate coordinates are within bounds
        if (x < width && y < height)
        {
            // Access memory efficiently
            in[y * rowSize + x] = value;
        }
    }
}