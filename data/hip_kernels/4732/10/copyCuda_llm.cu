#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copyCuda(const uint8_t* __restrict__ in, uint32_t rowSizeIn, uint8_t* __restrict__ out, uint32_t rowSizeOut, uint32_t width, uint32_t height)
{
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    // Early exit to improve efficiency
    if (x >= width || y >= height) return;

    // Optimize memory access using shared memory
    __shared__ uint8_t sharedMem[BLOCK_SIZE][BLOCK_SIZE];

    // Load data to shared memory
    sharedMem[threadIdx.y][threadIdx.x] = in[y * rowSizeIn + x];
    __syncthreads();

    // Write data from shared memory
    out[y * rowSizeOut + x] = sharedMem[threadIdx.y][threadIdx.x];
}