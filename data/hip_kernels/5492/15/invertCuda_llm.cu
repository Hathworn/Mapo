#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void invertCuda(const uint8_t *in, uint32_t rowSizeIn, uint8_t *out, uint32_t rowSizeOut, uint32_t width, uint32_t height) {
    // Use shared memory to optimize memory access
    extern __shared__ uint8_t sharedMem[];

    uint32_t localX = threadIdx.x;
    uint32_t localY = threadIdx.y;
    const uint32_t x = blockDim.x * blockIdx.x + localX;
    const uint32_t y = blockDim.y * blockIdx.y + localY;

    if (x < width && y < height) {
        // Load data to shared memory
        sharedMem[localY * blockDim.x + localX] = in[y * rowSizeIn + x];
        __syncthreads();

        // Perform inversion using shared memory
        out[y * rowSizeOut + x] = ~sharedMem[localY * blockDim.x + localX];
    }
}