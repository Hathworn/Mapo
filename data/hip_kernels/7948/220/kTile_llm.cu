```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* src, float* tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    // Calculate global index
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const int numThreads = blockDim.x * gridDim.x;

    // Loop through each target element that this thread is responsible for
    for (uint i = idx; i < tgtWidth * tgtHeight; i += numThreads) {
        const uint y = i / tgtWidth;
        const uint x = i % tgtWidth;
        // Compute source indices using modulo arithmetic
        const uint srcY = y % srcHeight;
        const uint srcX = x % srcWidth;

        // Read from source and write to target
        tgt[i] = src[srcY * srcWidth + srcX];
    }
}