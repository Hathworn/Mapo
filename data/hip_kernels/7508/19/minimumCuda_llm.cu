#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void minimumCuda(const uint8_t * in1, uint32_t rowSizeIn1, const uint8_t * in2, uint32_t rowSizeIn2, uint8_t * out, uint32_t rowSizeOut, uint32_t width, uint32_t height)
{
    // Calculate flattened index to optimize memory access
    const uint32_t idx = blockIdx.x * blockDim.x + threadIdx.x;
    const uint32_t idy = blockIdx.y * blockDim.y + threadIdx.y;

    if (idx < width && idy < height) {
        const uint32_t index = idy * rowSizeOut + idx; // Use a single index calculation

        // Load, compare, and store the minimum value
        const uint8_t val1 = in1[idy * rowSizeIn1 + idx];
        const uint8_t val2 = in2[idy * rowSizeIn2 + idx];
        out[index] = min(val1, val2);
    }
}