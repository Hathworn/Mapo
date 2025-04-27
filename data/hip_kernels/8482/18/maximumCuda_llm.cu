#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void maximumCuda(const uint8_t *in1, uint32_t rowSizeIn1, const uint8_t *in2, uint32_t rowSizeIn2, uint8_t *out, uint32_t rowSizeOut, uint32_t width, uint32_t height)
{
    // Calculate unique index for each thread
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    if (x < width && y < height) {
        // Calculate offset only once for efficiency
        uint32_t offset1 = y * rowSizeIn1 + x;
        uint32_t offset2 = y * rowSizeIn2 + x;
        uint32_t offsetOut = y * rowSizeOut + x;

        // Use offsets to access memory directly
        out[offsetOut] = (in1[offset1] > in2[offset2]) ? in1[offset1] : in2[offset2];
    }
}