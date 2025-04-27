#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* src, float* tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    // Compute global thread index
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Calculate total number of threads
    const int numThreads = blockDim.x * gridDim.x;

    // Use precomputed variables for repeated calculations
    const uint srcSize = srcWidth * srcHeight;
    const uint tgtSize = tgtWidth * tgtHeight;

    for (uint i = idx; i < tgtSize; i += numThreads) {
        // Compute y and x coordinates for target
        const uint y = i / tgtWidth;
        const uint x = i % tgtWidth;
        // Map target coordinates to source coordinates
        const uint srcY = y % srcHeight;
        const uint srcX = x % srcWidth;
        // Efficiently copy from source to target
        tgt[i] = src[srcY * srcWidth + srcX];
    }
}