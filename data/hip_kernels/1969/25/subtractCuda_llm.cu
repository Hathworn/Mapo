#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void subtractCuda(const uint8_t *in1, uint32_t rowSizeIn1, const uint8_t *in2, uint32_t rowSizeIn2, uint8_t *out, uint32_t rowSizeOut, uint32_t width, uint32_t height)
{
    // Calculate global indices
    const uint32_t x = blockIdx.x * blockDim.x + threadIdx.x;
    const uint32_t y = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure within bounds
    if (x < width && y < height) {
        // Inline calculation for improved performance
        const uint8_t in1Val = *(in1 + y * rowSizeIn1 + x);
        const uint8_t in2Val = *(in2 + y * rowSizeIn2 + x);
        uint8_t *outX = out + y * rowSizeOut + x;
        *outX = (in1Val > in2Val) ? (in1Val - in2Val) : 0;
    }
}