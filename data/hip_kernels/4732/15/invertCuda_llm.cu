#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void invertCuda(const uint8_t *in, uint32_t rowSizeIn, uint8_t *out, uint32_t rowSizeOut, uint32_t width, uint32_t height)
{
    // Calculate flattened index for 1D memory access
    const uint32_t idx = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t idy = blockDim.y * blockIdx.y + threadIdx.y;

    // Check bounds for valid pixel processing
    if (idx < width && idy < height) {
        // Compute linear memory coordinate and perform inversion
        const uint32_t indexIn = idy * rowSizeIn + idx;
        const uint32_t indexOut = idy * rowSizeOut + idx;
        out[indexOut] = ~in[indexIn];
    }
}