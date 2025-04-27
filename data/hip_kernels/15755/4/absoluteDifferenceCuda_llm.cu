#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void absoluteDifferenceCuda(const uint8_t *in1, uint32_t rowSizeIn1, const uint8_t *in2, uint32_t rowSizeIn2, uint8_t *out, uint32_t rowSizeOut, uint32_t width, uint32_t height)
{
    // Calculate the global index once for thread
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    // Proceed only if within bounds
    if (x < width && y < height) {
        // Use direct access to global memory using flattened index
        const uint32_t indexIn1 = y * rowSizeIn1 + x;
        const uint32_t indexIn2 = y * rowSizeIn2 + x;
        const uint32_t indexOut = y * rowSizeOut + x;

        // Perform the absolute difference calculation
        out[indexOut] = abs(in1[indexIn1] - in2[indexIn2]);
    }
}