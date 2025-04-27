#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void absoluteDifferenceCuda(const uint8_t * in1, uint32_t rowSizeIn1, const uint8_t * in2, uint32_t rowSizeIn2, uint8_t * out, uint32_t rowSizeOut, uint32_t width, uint32_t height) 
{
    // Calculate global indices for x and y
    const uint32_t x = blockIdx.x * blockDim.x + threadIdx.x;
    const uint32_t y = blockIdx.y * blockDim.y + threadIdx.y;

    if (x < width && y < height) {
        // Directly compute offset without using additional pointers
        const uint32_t offsetIn1 = y * rowSizeIn1 + x;
        const uint32_t offsetIn2 = y * rowSizeIn2 + x;
        const uint32_t offsetOut = y * rowSizeOut + x;
        
        // Simplified absolute difference calculation
        out[offsetOut] = abs(in1[offsetIn1] - in2[offsetIn2]);
    }
}