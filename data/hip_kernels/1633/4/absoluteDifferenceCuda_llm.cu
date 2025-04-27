#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void absoluteDifferenceCuda(const uint8_t *in1, uint32_t rowSizeIn1, const uint8_t *in2, uint32_t rowSizeIn2, uint8_t *out, uint32_t rowSizeOut, uint32_t width, uint32_t height)
{
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    if (x < width && y < height) {
        // Directly calculate offset without extra pointer arithmetic
        const uint32_t offsetIn1 = y * rowSizeIn1 + x;
        const uint32_t offsetIn2 = y * rowSizeIn2 + x;
        const uint32_t offsetOut = y * rowSizeOut + x;

        // Use register for temporary storage
        const uint8_t val1 = in1[offsetIn1];
        const uint8_t val2 = in2[offsetIn2];

        // Write result directly to output
        out[offsetOut] = (val1 > val2) ? (val1 - val2) : (val2 - val1);
    }
}