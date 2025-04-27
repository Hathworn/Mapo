#include "hip/hip_runtime.h"
#include "includes.h"

// Use __restrict__ to hint the compiler about non-aliasing for potential optimizations
__global__ void bitwiseOrCuda(const uint8_t *__restrict__ in1, uint32_t rowSizeIn1, 
                              const uint8_t *__restrict__ in2, uint32_t rowSizeIn2, 
                              uint8_t *__restrict__ out, uint32_t rowSizeOut, 
                              uint32_t width, uint32_t height) 
{
    // Compute global thread index
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    // Use shared memory for common row size access
    if (x < width && y < height) {
        const uint32_t yOffset = y * rowSizeOut;  // Shared computation
        const uint32_t idIn1 = yOffset + (x % rowSizeIn1);  // Handle row offset with modulo for safety
        const uint32_t idIn2 = yOffset + (x % rowSizeIn2);
        const uint32_t idOut = yOffset + x;
        out[idOut] = in1[idIn1] | in2[idIn2];
    }
}
```
