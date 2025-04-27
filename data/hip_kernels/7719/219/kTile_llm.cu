#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* src, float* tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const int numThreads = blockDim.x * gridDim.x;
    const uint numEls = tgtWidth * tgtHeight;

    for (uint i = idx; i < numEls; i += numThreads) {
        // Calculate y and x positions in the target
        const uint y = i / tgtWidth;
        const uint x = i % tgtWidth;
        // Calculate corresponding positions in the source
        const uint srcY = y % srcHeight;
        const uint srcX = x % srcWidth;
        // Map the value from source to target
        tgt[i] = src[srcY * srcWidth + srcX];
    }
}