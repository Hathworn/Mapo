#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setPixelCuda(uint8_t *in, uint32_t rowSize, uint32_t width, uint32_t height, uint32_t *pointX, uint32_t *pointY, uint32_t pointSize, uint32_t value)
{
    // Calculate the global thread index
    const uint32_t idPoint = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if the index is within the point size
    if (idPoint < pointSize)
    {
        // Use register variables to reduce global memory access
        const uint32_t x = pointX[idPoint];
        const uint32_t y = pointY[idPoint];

        // Check if the coordinates are within bounds and set the pixel value
        if (x < width && y < height)
        {
            in[y * rowSize + x] = value;
        }
    }
}