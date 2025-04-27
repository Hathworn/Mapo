#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kTile(const float* src, float* tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    // Calculate thread index once
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Calculate total threads only once and store
    const int numThreads = blockDim.x * gridDim.x;

    // Iterate over output indices, skip computed tiles for efficiency
    for (uint i = idx; i < tgtWidth * tgtHeight; i += numThreads) {
        const uint y = i / tgtWidth;
        const uint x = i % tgtWidth;
        const uint srcY = y % srcHeight;
        const uint srcX = x % srcWidth;
        // Directly index into src and tgt
        tgt[i] = src[srcY * srcWidth + srcX];
    }
}