#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void maximumCuda(const uint8_t * in1, uint32_t rowSizeIn1, const uint8_t * in2, uint32_t rowSizeIn2, uint8_t * out, uint32_t rowSizeOut, uint32_t width, uint32_t height)
{
    // Calculate global thread index in both dimensions
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    // Ensure the thread is within image bounds
    if (x < width && y < height) {
        const uint32_t idx = y * rowSizeOut + x; // Flatten index calculation for improved access
        out[idx] = max(in1[y * rowSizeIn1 + x], in2[y * rowSizeIn2 + x]); // Use built-in max function for clarity
    }
}