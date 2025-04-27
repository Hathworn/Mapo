#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void minimumCuda(const uint8_t * in1, uint32_t rowSizeIn1, const uint8_t * in2, uint32_t rowSizeIn2, uint8_t * out, uint32_t rowSizeOut, uint32_t width, uint32_t height)
{
    // Calculate single linear index to optimize memory coalescing
    const uint32_t idx = blockIdx.y * blockDim.y * rowSizeOut + blockIdx.x * blockDim.x + threadIdx.y * rowSizeOut + threadIdx.x;

    // Calculate row and column index
    const uint32_t x = idx % rowSizeOut;
    const uint32_t y = idx / rowSizeOut;

    if (x < width && y < height) {
        const uint8_t *in1X = in1 + y * rowSizeIn1 + x;
        const uint8_t *in2X = in2 + y * rowSizeIn2 + x;
        uint8_t *outX = out + y * rowSizeOut + x;
        (*outX) = ((*in1X) < (*in2X)) ? (*in1X) : (*in2X);
    }
}