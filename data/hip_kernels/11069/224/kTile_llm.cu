#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* src, float* tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    // Calculate global thread index
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Commonly reused calculation
    const int numThreads = blockDim.x * gridDim.x;

    // Use grid-stride loop for better performance
    for (uint i = idx; i < tgtWidth * tgtHeight; i += numThreads) {
        // Calculate current position in target
        const uint y = i / tgtWidth;
        const uint x = i % tgtWidth;
        // Map position to source
        const uint srcY = y % srcHeight;
        const uint srcX = x % srcWidth;
        // Assign value from source to target
        tgt[i] = src[srcY * srcWidth + srcX];
    }
}