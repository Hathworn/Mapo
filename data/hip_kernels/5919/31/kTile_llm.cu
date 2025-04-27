#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* src, float* tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const int numThreads = blockDim.x * gridDim.x;
    const uint numEls = tgtWidth * tgtHeight; // Precompute total elements to avoid computing every iteration

    for (uint i = idx; i < numEls; i += numThreads) {
        const uint y = i / tgtWidth;
        const uint x = i % tgtWidth;
        const uint srcY = y % srcHeight; // Use modulo to map target dimensions to source
        const uint srcX = x % srcWidth;
        tgt[i] = __ldg(&src[srcY * srcWidth + srcX]); // Use __ldg for read-only cache optimization
    }
}