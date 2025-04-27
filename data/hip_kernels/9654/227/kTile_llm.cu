#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* __restrict__ src, float* __restrict__ tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const int numThreads = blockDim.x * gridDim.x;
    
    // Use faster access into arrays by leveraging shared memory
    for (uint i = idx; i < tgtWidth * tgtHeight; i += numThreads) {
        // Compute target indices
        const uint y = i / tgtWidth;
        const uint x = i % tgtWidth;

        // Compute source indices
        const uint srcY = y % srcHeight;
        const uint srcX = x % srcWidth;

        // Direct memory access with better locality
        tgt[i] = src[srcY * srcWidth + srcX];
    }
}