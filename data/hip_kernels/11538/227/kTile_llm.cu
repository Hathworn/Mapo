#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* src, float* tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    // Calculate unique thread index
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const int stride = blockDim.x * gridDim.x; // Optimize thread stride calculation

    for (uint i = idx; i < tgtWidth * tgtHeight; i += stride) {
        const uint y = i / tgtWidth;
        const uint x = i % tgtWidth;
        const uint srcY = y % srcHeight;
        const uint srcX = x % srcWidth;
        tgt[i] = src[srcY * srcWidth + srcX]; // Efficient memory access pattern
    }
}