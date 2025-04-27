#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void RgbToRgbaKernel(const uint8_t *__restrict__ input, uint8_t *__restrict__ output, size_t pitch, size_t width_px, size_t height) {
    constexpr size_t in_channels = 3, out_channels = 4;
    size_t x = threadIdx.x + blockIdx.x * blockDim.x;
    size_t y = threadIdx.y + blockIdx.y * blockDim.y;
    
    // Early exit for threads outside image bounds
    if (x >= width_px || y >= height) return;
    
    size_t in_idx = in_channels * x + in_channels * width_px * y;
    size_t out_idx = out_channels * x + pitch * y;
    
    // Coalesce memory accesses for better cache efficiency
    uint8_t r = input[in_idx];
    uint8_t g = input[in_idx + 1];
    uint8_t b = input[in_idx + 2];
    
    output[out_idx] = r;
    output[out_idx + 1] = g;
    output[out_idx + 2] = b;
    output[out_idx + 3] = 255;  // Set alpha channel to maximum
}