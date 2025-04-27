#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void subtractCuda(const uint8_t* __restrict__ in1, uint32_t rowSizeIn1, const uint8_t* __restrict__ in2, uint32_t rowSizeIn2, uint8_t* __restrict__ out, uint32_t rowSizeOut, uint32_t width, uint32_t height)
{
    // Calculate global thread indexes
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    // Check if within image bounds
    if (x < width && y < height) {
        // Use pointer arithmetic for indices
        const uint8_t in1Val = in1[y * rowSizeIn1 + x];
        const uint8_t in2Val = in2[y * rowSizeIn2 + x];

        // Compute subtraction and store in output
        uint8_t* outX = out + y * rowSizeOut + x;
        *outX = (in1Val > in2Val) ? (in1Val - in2Val) : 0;
    }
}