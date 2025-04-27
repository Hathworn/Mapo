#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void absoluteDifferenceCuda(const uint8_t *in1, uint32_t rowSizeIn1, const uint8_t *in2, uint32_t rowSizeIn2, uint8_t *out, uint32_t rowSizeOut, uint32_t width, uint32_t height)
{
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    if (x < width && y < height) {
        // Prefetch memory addresses
        const uint32_t indexIn1 = y * rowSizeIn1 + x;
        const uint32_t indexIn2 = y * rowSizeIn2 + x;
        const uint32_t indexOut = y * rowSizeOut + x;
        
        // Compute absolute difference using prefetch indices
        out[indexOut] = (in1[indexIn1] > in2[indexIn2]) ? 
                        (in1[indexIn1] - in2[indexIn2]) : 
                        (in2[indexIn2] - in1[indexIn1]);
    }
}