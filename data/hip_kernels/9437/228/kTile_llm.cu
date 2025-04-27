#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kTile(const float* src, float* tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    // Calculate a single thread index for 2D grid
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const int numThreads = blockDim.x * gridDim.x;

    // Iterate over the output using the single thread index
    for (uint i = idx; i < tgtWidth * tgtHeight; i += numThreads) {
        // Directly compute source indices using modulo operations
        const uint srcY = (i / tgtWidth) % srcHeight;
        const uint srcX = (i % tgtWidth) % srcWidth;
        tgt[i] = src[srcY * srcWidth + srcX]; // Efficiently map tgt to src
    }
}