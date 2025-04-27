#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* src, float* tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    // Optimize data indexing and loop order to improve memory access patterns
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const int stride = blockDim.x * gridDim.x;
    for (uint i = idx; i < tgtWidth * tgtHeight; i += stride) {
        // Compute target coordinates
        const uint y = i / tgtWidth;
        const uint x = i % tgtWidth;
        // Efficiently map target coordinates to source coordinates
        tgt[i] = src[(y % srcHeight) * srcWidth + (x % srcWidth)];
    }
}