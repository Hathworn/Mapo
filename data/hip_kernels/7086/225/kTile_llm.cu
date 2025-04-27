#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* src, float* tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    // Improved block and thread indexing
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Efficient loop using calculated stride
    for (uint i = idx; i < tgtWidth * tgtHeight; i += stride) {
        const uint y = i / tgtWidth;
        const uint x = i % tgtWidth;
        // Calculate source indices with modulo for wrapping
        const uint srcY = y % srcHeight;
        const uint srcX = x % srcWidth;
        // Map target to tiled source
        tgt[i] = src[srcY * srcWidth + srcX];
    }
}