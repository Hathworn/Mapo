#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* src, float* tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    // Compute a unique global index for each thread
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const int stride = blockDim.x * gridDim.x;

    // Loop through elements more efficiently using thread stride
    for (uint i = idx; i < tgtWidth * tgtHeight; i += stride) {
        const uint y = i / tgtWidth;
        const uint x = i % tgtWidth;
        
        // Calculate source positions using modulo to correctly tile
        const uint srcY = y % srcHeight;
        const uint srcX = x % srcWidth;
        
        // Assign tiled values to target
        tgt[i] = src[srcY * srcWidth + srcX];
    }
}