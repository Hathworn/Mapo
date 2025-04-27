#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copyCuda(const uint8_t *in, uint32_t rowSizeIn, uint8_t *out, uint32_t rowSizeOut, uint32_t width, uint32_t height)
{
    // Calculate global row index using 1D block dimension to optimize parallel reading
    const uint32_t row = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Calculate global column index using 1D block dimension to optimize parallel writing
    const uint32_t col = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure that threads only attempt to access memory within bounds
    if (col < width && row < height) {
        out[row * rowSizeOut + col] = in[row * rowSizeIn + col];
    }
}