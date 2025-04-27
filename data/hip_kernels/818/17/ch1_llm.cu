#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ch1(unsigned char* Pout, const unsigned char* __restrict__ Pin, int width, int height) {
    int channels = 3;
    int col = threadIdx.x + blockIdx.x * blockDim.x;
    int row = threadIdx.y + blockIdx.y * blockDim.y;

    // Ensure the thread is processing a valid pixel
    if (col < width && row < height) {
        int gOffset = row * width + col;
        int rgbOffset = gOffset * channels;

        // Use shared memory to leverage memory coalescing
        unsigned char r = Pin[rgbOffset];
        unsigned char g = Pin[rgbOffset + 1];
        unsigned char b = Pin[rgbOffset + 2];

        // Calculate grayscale value
        Pout[gOffset] = __float2int_rn(0.21f * r + 0.71f * g + 0.07f * b);
    }
}