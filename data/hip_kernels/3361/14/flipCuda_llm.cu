#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void flipCuda(const uint8_t *in, uint32_t rowSizeIn, uint8_t *out, uint32_t rowSizeOut, uint32_t width, uint32_t height, bool horizontal, bool vertical)
{
    // Use shared memory to increase memory access speed
    __shared__ uint8_t tile[32][32 + 1]; // For potential bank conflict avoidance

    const uint32_t inX = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t inY = blockDim.y * blockIdx.y + threadIdx.y;

    if (inX < width && inY < height) {
        // Read input to shared memory
        tile[threadIdx.y][threadIdx.x] = in[inY * rowSizeIn + inX];
        __syncthreads();

        const uint32_t outX = horizontal ? (width - 1 - inX) : inX;
        const uint32_t outY = vertical ? (height - 1 - inY) : inY;

        // Write back from shared memory
        out[outY * rowSizeOut + outX] = tile[threadIdx.y][threadIdx.x];
    }
}