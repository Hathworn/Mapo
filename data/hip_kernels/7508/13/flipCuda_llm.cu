#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void flipCuda(const uint8_t * in, uint32_t rowSizeIn, uint8_t * out, uint32_t rowSizeOut, uint32_t width, uint32_t height, bool horizontal, bool vertical)
{
    // Use shared memory for better memory access patterns
    __shared__ uint8_t tile[32][32];  // Assuming a block size of 32x32 for illustration

    const uint32_t inX = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t inY = blockDim.y * blockIdx.y + threadIdx.y;

    // Load data into shared memory
    if (inX < width && inY < height) {
        tile[threadIdx.y][threadIdx.x] = in[inY * rowSizeIn + inX];
    }
    __syncthreads();

    // Calculate flipped coordinates
    const uint32_t outX = horizontal ? (width - 1 - inX) : inX;
    const uint32_t outY = vertical ? (height - 1 - inY) : inY;

    // Write the flipped pixel value
    if (inX < width && inY < height) {
        out[outY * rowSizeOut + outX] = tile[threadIdx.y][threadIdx.x];
    }
}