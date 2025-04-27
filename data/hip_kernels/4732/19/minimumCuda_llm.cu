#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void minimumCuda(const uint8_t* __restrict__ in1, uint32_t rowSizeIn1, const uint8_t* __restrict__ in2, uint32_t rowSizeIn2, uint8_t* __restrict__ out, uint32_t rowSizeOut, uint32_t width, uint32_t height)
{
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    // Ensure thread is within image bounds
    if (x < width && y < height) {
        // Use DOF (pointer differential offset) and reduce pointer dereference
        uint32_t offset1 = y * rowSizeIn1 + x;
        uint32_t offset2 = y * rowSizeIn2 + x;
        uint32_t offsetOut = y * rowSizeOut + x;
        
        out[offsetOut] = min(in1[offset1], in2[offset2]); // Utilize min intrinsic
    }
}