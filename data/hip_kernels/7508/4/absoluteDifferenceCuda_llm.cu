#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void absoluteDifferenceCuda( const uint8_t * in1, uint32_t rowSizeIn1, const uint8_t * in2, uint32_t rowSizeIn2, uint8_t * out, uint32_t rowSizeOut, uint32_t width, uint32_t height )
{
    // Calculate global thread index
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    // Ensure index is within bounds
    if (x < width && y < height) {
        // Use single pointer arithmetic instead of additional variables
        uint32_t index = y * rowSizeIn1 + x;
        uint8_t val1 = in1[index];
        uint8_t val2 = in2[y * rowSizeIn2 + x];
        out[y * rowSizeOut + x] = (val1 > val2) ? (val1 - val2) : (val2 - val1);
    }
}