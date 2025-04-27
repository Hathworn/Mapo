#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void grayscale(unsigned char *rgb, unsigned char *g, std::size_t cols, std::size_t rows) {
    // Calculate overall pixel index
    auto index = blockIdx.y * blockDim.y * cols + blockIdx.x * blockDim.x + threadIdx.y * cols + threadIdx.x;
    // Ensure index is within bounds
    if (index < cols * rows) {
        // Calculate grayscale value using predefined constants, avoid recomputation
        g[index] = (307 * rgb[3 * index] + 604 * rgb[3 * index + 1] + 113 * rgb[3 * index + 2]) / 1024;
    }
}