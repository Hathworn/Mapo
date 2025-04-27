#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void grayscale(unsigned char *rgb, unsigned char *g, std::size_t cols, std::size_t rows) {
    auto i = blockIdx.x * blockDim.x + threadIdx.x;
    auto j = blockIdx.y * blockDim.y + threadIdx.y;
    if (i < cols && j < rows) {
        // Precompute index base for pixel access
        auto index = 3 * (j * cols + i);
        // Use registers for intermediate results to improve performance
        unsigned char r = rgb[index];
        unsigned char b = rgb[index + 1];
        unsigned char g_ = rgb[index + 2];
        g[j * cols + i] = (307 * r + 604 * b + 113 * g_) / 1024;
    }
}