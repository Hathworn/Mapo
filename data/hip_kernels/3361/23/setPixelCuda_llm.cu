```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void setPixelCuda( uint8_t * in, uint32_t rowSize, uint32_t width, uint32_t height, uint32_t * pointX, uint32_t * pointY, uint32_t pointSize, uint32_t value )
{
    // Use shared memory for point data
    __shared__ uint32_t sharedPointX[256];
    __shared__ uint32_t sharedPointY[256];

    const uint32_t idPoint = blockIdx.x * blockDim.x + threadIdx.x;

    // Load points into shared memory
    if (threadIdx.x < pointSize) {
        sharedPointX[threadIdx.x] = pointX[idPoint];
        sharedPointY[threadIdx.x] = pointY[idPoint];
    }
    __syncthreads();

    if (idPoint < pointSize) {
        const uint32_t x = sharedPointX[threadIdx.x];
        const uint32_t y = sharedPointY[threadIdx.x];
        // Check if point is within bounds and set the pixel
        if (x < width && y < height) {
            in[y * rowSize + x] = value;
        }
    }
}