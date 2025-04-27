#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kTile(const float* __restrict__ src, float* __restrict__ tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    // Calculate thread index and total number of threads
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const int numThreads = blockDim.x * gridDim.x;

    // Loop through target elements with stride equal to total number of threads
    for (uint i = idx; i < tgtWidth * tgtHeight; i += numThreads) {
        // Compute target y and x using division and modulus
        const uint y = i / tgtWidth;
        const uint x = i % tgtWidth;

        // Calculate source indices using modulus for tiling
        const uint srcY = y % srcHeight;
        const uint srcX = x % srcWidth;

        // Copy tiled values from source to target
        tgt[i] = src[srcY * srcWidth + srcX];
    }
}