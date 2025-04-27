#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void maximumCuda(const uint8_t * in1, uint32_t rowSizeIn1, const uint8_t * in2, uint32_t rowSizeIn2, uint8_t * out, uint32_t rowSizeOut, uint32_t width, uint32_t height)
{
    // Calculate the unique thread index for the 2D grid
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;
    
    // Check if the thread is within image boundaries
    if (x < width && y < height) {
        // Compute the linear indices directly without intermediate variables
        uint32_t indexIn1 = y * rowSizeIn1 + x;
        uint32_t indexIn2 = y * rowSizeIn2 + x;
        uint32_t indexOut = y * rowSizeOut + x;

        // Perform the maximum operation
        out[indexOut] = (in1[indexIn1] > in2[indexIn2]) ? in1[indexIn1] : in2[indexIn2];
    }
}