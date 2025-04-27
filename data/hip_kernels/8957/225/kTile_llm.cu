#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* src, float* tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    // Calculate global thread ID
    const uint idx = blockIdx.x * blockDim.x + threadIdx.x;
    const uint idy = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Calculate the number of threads in x and y dimensions
    const uint numThreadsX = blockDim.x * gridDim.x;
    const uint numThreadsY = blockDim.y * gridDim.y;
    
    // Optimize looping strategy by considering both x and y dimensions
    for (uint y = idy; y < tgtHeight; y += numThreadsY) {
        for (uint x = idx; x < tgtWidth; x += numThreadsX) {
            // Calculate source coordinates using modulo for tiling
            const uint srcY = y % srcHeight;
            const uint srcX = x % srcWidth;
            // Assign the tile-matched element from source to target
            tgt[y * tgtWidth + x] = src[srcY * srcWidth + srcX];
        }
    }
}