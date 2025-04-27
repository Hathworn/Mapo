```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* __restrict__ src, float* __restrict__ tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    // Calculate global thread ID
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const int numThreads = blockDim.x * gridDim.x;

    // Loop through elements with stride of total threads
    for (uint i = idx; i < tgtWidth * tgtHeight; i += numThreads) {
        // Calculate target coordinates and corresponding source coordinates
        const uint y = i / tgtWidth;
        const uint x = i % tgtWidth;
        const uint srcY = y % srcHeight;
        const uint srcX = x % srcWidth;
        
        // Assign value from source to target using calculated coordinates
        tgt[i] = src[srcY * srcWidth + srcX];
    }
}