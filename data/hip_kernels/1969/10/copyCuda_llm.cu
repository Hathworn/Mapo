#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copyCuda(const uint8_t *in, uint32_t rowSizeIn, uint8_t *out, uint32_t rowSizeOut, uint32_t width, uint32_t height) {
    // Calculate linear index for 1D access
    const uint32_t idx = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t idy = blockDim.y * blockIdx.y + threadIdx.y;

    // Combine 2D coordinates into a linear index for optimization
    const uint32_t globalIdx = idy * rowSizeOut + idx;
    
    if (idx < width && idy < height) {
        out[globalIdx] = in[idy * rowSizeIn + idx];
    }
}