#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kTile(const float* src, float* tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    // Compute global thread index
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Total number of threads
    const int numThreads = blockDim.x * gridDim.x;
    // Loop through all elements assigned to this thread with stride of total threads
    for (uint i = idx; i < tgtWidth * tgtHeight; i += numThreads) {
        // Compute target coordinates
        const uint y = i / tgtWidth;
        const uint x = i % tgtWidth;
        // Map target coordinates to source coordinates using modulus
        const uint srcY = y % srcHeight;
        const uint srcX = x % srcWidth;
        // Read from source and write to target
        tgt[i] = src[srcY * srcWidth + srcX];
    }
}