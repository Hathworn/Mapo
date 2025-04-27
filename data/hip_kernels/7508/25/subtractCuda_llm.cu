#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subtractCuda(const uint8_t *in1, uint32_t rowSizeIn1, const uint8_t *in2, uint32_t rowSizeIn2, uint8_t *out, uint32_t rowSizeOut, uint32_t width, uint32_t height) {
    // Use shared memory to reduce global memory access (if applicable)
    cPrconst uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    if (x < width && y < height) {
        // Calculate linear index once to optimize accesses
        uint32_t idxIn1 = y * rowSizeIn1 + x;
        uint32_t idxIn2 = y * rowSizeIn2 + x;
        uint32_t idxOut = y * rowSizeOut + x;

        uint8_t val1 = in1[idxIn1];
        uint8_t val2 = in2[idxIn2];
        out[idxOut] = (val1 > val2) ? (val1 - val2) : 0;
    }
}