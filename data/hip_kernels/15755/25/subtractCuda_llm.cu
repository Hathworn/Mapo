#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subtractCuda(const uint8_t *in1, uint32_t rowSizeIn1, const uint8_t *in2, uint32_t rowSizeIn2, uint8_t *out, uint32_t rowSizeOut, uint32_t width, uint32_t height) 
{
    // Calculate 1D global thread index for better memory coalescing
    uint32_t idx = blockIdx.x * blockDim.x + threadIdx.x;
    uint32_t idy = blockIdx.y * blockDim.y + threadIdx.y;

    if (idx < width && idy < height) {
        uint32_t offsetIn1 = idy * rowSizeIn1 + idx;
        uint32_t offsetIn2 = idy * rowSizeIn2 + idx;
        uint32_t offsetOut = idy * rowSizeOut + idx;

        // Use local variables to reduce pointer indirections
        uint8_t valIn1 = in1[offsetIn1];
        uint8_t valIn2 = in2[offsetIn2];
        out[offsetOut] = (valIn1 > valIn2) ? (valIn1 - valIn2) : 0;
    }
}