#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* src, float* tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    // Calculate global thread index
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const int numThreads = blockDim.x * gridDim.x;

    for (uint i = idx; i < tgtWidth * tgtHeight; i += numThreads) {
        // Calculate corresponding coordinates in source
        const uint srcY = (i / tgtWidth) % srcHeight;
        const uint srcX = (i % tgtWidth) % srcWidth;
        // Perform tiling operation
        tgt[i] = src[srcY * srcWidth + srcX];
    }
}