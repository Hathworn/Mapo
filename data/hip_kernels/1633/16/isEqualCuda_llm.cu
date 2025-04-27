#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void isEqualCuda(const uint8_t* in1, uint32_t rowSizeIn1, const uint8_t* in2, uint32_t rowSizeIn2, uint32_t width, uint32_t height, uint32_t* isEqual) 
{
    // Use 1D block and grid for efficient memory access
    const uint32_t idx = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t totalThreads = blockDim.x * gridDim.x;

    uint32_t localIsEqual = 1; // Local flag for partial results

    for (uint32_t i = idx; i < width * height; i += totalThreads) {
        const uint32_t y = i / width; // Calculate row
        const uint32_t x = i % width; // Calculate column
        if (in1[y * rowSizeIn1 + x] != in2[y * rowSizeIn2 + x]) {
            localIsEqual = 0; // If any element is not equal, set local flag to 0
        }
    }

    // Atomic AND on global flag only if a mismatch is found
    if(localIsEqual == 0)
        atomicAnd(isEqual, localIsEqual);
}