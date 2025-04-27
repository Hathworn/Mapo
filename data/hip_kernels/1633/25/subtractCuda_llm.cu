#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subtractCuda(const uint8_t *in1, uint32_t rowSizeIn1, const uint8_t *in2, uint32_t rowSizeIn2, uint8_t *out, uint32_t rowSizeOut, uint32_t width, uint32_t height)
{
    // Calculate x and y using direct multiplication, avoiding repeated blockIdx and threadIdx computation
    const uint32_t idx = blockDim.x * blockDim.y * blockIdx.y + blockDim.x * blockIdx.x + threadIdx.y * blockDim.x + threadIdx.x;

    // Use flat index for bounds check to ensure the thread is within valid pixel range
    if (idx < width * height) {
        // Calculate y and x coordinates based on the flat index
        const uint32_t x = idx % width;
        const uint32_t y = idx / width;

        // Use more descriptive array access with direct addition, reducing pointer arithmetic complexity
        out[y * rowSizeOut + x] = (in1[y * rowSizeIn1 + x] > in2[y * rowSizeIn2 + x]) 
                                  ? (in1[y * rowSizeIn1 + x] - in2[y * rowSizeIn2 + x]) 
                                  : 0;
    }
}