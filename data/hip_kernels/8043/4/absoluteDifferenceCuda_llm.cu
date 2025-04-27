#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void absoluteDifferenceCuda(const uint8_t *in1, uint32_t rowSizeIn1, const uint8_t *in2, uint32_t rowSizeIn2, uint8_t *out, uint32_t rowSizeOut, uint32_t width, uint32_t height)
{
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    if (x < width && y < height) {
        // Load values from global memory once per thread
        const uint8_t val1 = in1[y * rowSizeIn1 + x];
        const uint8_t val2 = in2[y * rowSizeIn2 + x];
        uint8_t result = (val1 > val2) ? (val1 - val2) : (val2 - val1);
        out[y * rowSizeOut + x] = result;
    }
}