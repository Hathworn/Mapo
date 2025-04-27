#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void grayscale(unsigned char *rgb, unsigned char *g, std::size_t cols, std::size_t rows) {
    // Calculate global thread ID
    auto i = blockIdx.x * blockDim.x + threadIdx.x;
    auto j = blockIdx.y * blockDim.y + threadIdx.y;

    // Check if thread is within image bounds
    if (i < cols && j < rows) {
        // Cache repeated calculation for efficiency
        auto index = 3 * (j * cols + i);
        // Update grayscale array
        g[j * cols + i] = (307 * rgb[index] + 604 * rgb[index + 1] + 113 * rgb[index + 2]) / 1024;
    }
}