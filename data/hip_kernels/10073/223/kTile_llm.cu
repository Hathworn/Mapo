#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* src, float* tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    // Optimize thread indexing by computing once and removing redundant division
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const int numThreads = blockDim.x * gridDim.x;
    const uint numEls = tgtWidth * tgtHeight;
    const uint srcArea = srcWidth * srcHeight;

    for (uint i = idx; i < numEls; i += numThreads) {
        const uint y = i / tgtWidth;
        const uint x = i % tgtWidth;
        // Prevent redundant modulus operation by using pre-computed srcArea
        const uint srcY = y < srcHeight ? y : y % srcHeight;
        const uint srcX = x < srcWidth ? x : x % srcWidth;
        tgt[i] = src[srcY * srcWidth + srcX];
    }
}