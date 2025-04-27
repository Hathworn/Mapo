#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize by using shared memory for faster data access
__global__ void copyCuda(const uint8_t *in, uint32_t rowSizeIn, uint8_t *out, uint32_t rowSizeOut, uint32_t width, uint32_t height)
{
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    if (x < width && y < height) {
        // Copy data using shared memory
        __shared__ uint8_t tile[BLOCK_SIZE][BLOCK_SIZE];
        tile[threadIdx.y][threadIdx.x] = in[y * rowSizeIn + x];
        __syncthreads();
        out[y * rowSizeOut + x] = tile[threadIdx.y][threadIdx.x];
    }
}