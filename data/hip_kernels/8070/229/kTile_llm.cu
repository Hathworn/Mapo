#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* src, float* tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    // Calculate the global thread index
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Total number of threads
    const int numThreads = blockDim.x * gridDim.x;

    // Loop over all elements assigned to this thread
    for (uint i = idx; i < tgtWidth * tgtHeight; i += numThreads) {
        const uint y = i / tgtWidth;  // Compute target y coordinate
        const uint x = i % tgtWidth;  // Compute target x coordinate
        const uint srcY = y % srcHeight;  // Compute source y coordinate with tiling
        const uint srcX = x % srcWidth;  // Compute source x coordinate with tiling
        tgt[i] = src[srcY * srcWidth + srcX];  // Set target pixel value
    }
}