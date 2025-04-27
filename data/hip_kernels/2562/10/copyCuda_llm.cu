#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copyCuda(const uint8_t * in, uint32_t rowSizeIn, uint8_t * out, uint32_t rowSizeOut, uint32_t width, uint32_t height)
{
    // Calculate the unique index for every thread in a 1D manner to improve global memory coalescing
    const uint32_t index = blockIdx.y * blockDim.y * rowSizeOut + blockIdx.x * blockDim.x + threadIdx.y * rowSizeOut + threadIdx.x;
    const uint32_t pixelIndex = blockIdx.y * blockDim.y + threadIdx.y;
    const uint32_t rowElements = blockDim.x * gridDim.x;
    
    if (pixelIndex < height && threadIdx.x < width) {
        out[index] = in[pixelIndex * rowSizeIn + threadIdx.x];
    }
}