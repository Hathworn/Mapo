#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void invertCuda(const uint8_t * in, uint32_t rowSizeIn, uint8_t * out, uint32_t rowSizeOut, uint32_t width, uint32_t height)
{
    // Calculate global thread ID to merge 2D indexing into 1D for coalesced memory access
    const uint32_t index = blockIdx.y * blockDim.y * rowSizeOut + blockIdx.x * blockDim.x + threadIdx.y * rowSizeOut + threadIdx.x;

    if (index < width * height) {
        // Use single index computation to access linear memory
        out[index] = ~in[index];
    }
}