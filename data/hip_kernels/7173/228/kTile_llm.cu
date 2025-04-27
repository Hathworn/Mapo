```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* src, float* tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    // Calculate the global index once and reuse it
    const int idx = blockDim.x * blockIdx.x + threadIdx.x;
    const int numThreads = blockDim.x * gridDim.x;

    // Process elements that this thread is responsible for
    for (uint i = idx; i < tgtWidth * tgtHeight; i += numThreads) {
        // Use integer division and modulo operations to map 
        // target coordinates to source coordinates
        const uint y = i / tgtWidth;
        const uint x = i % tgtWidth;
        const uint srcY = y % srcHeight;
        const uint srcX = x % srcWidth;

        // Transfer data from source to target
        tgt[i] = src[srcY * srcWidth + srcX];
    }
}