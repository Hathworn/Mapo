#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* __restrict__ src, float* __restrict__ tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    // Calculate the global thread index
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Calculate total number of threads
    const int numThreads = blockDim.x * gridDim.x;

    // Use loop unrolling to reduce the number of iterations
    for (uint i = idx; i < tgtWidth * tgtHeight; i += numThreads * 4) {
        // Calculate x, y, and corresponding source coordinates
        const uint y = i / tgtWidth;
        const uint x = i % tgtWidth;
        const uint srcY = y % srcHeight;
        const uint srcX = x % srcWidth;

        // Calculate target and source indices for four elements at a time
        if (i < tgtWidth * tgtHeight) {
            tgt[i] = src[srcY * srcWidth + srcX];
        }
        if (i + numThreads < tgtWidth * tgtHeight) {
            tgt[i + numThreads] = src[srcY * srcWidth + ((srcX + numThreads) % srcWidth)];
        }
        if (i + 2 * numThreads < tgtWidth * tgtHeight) {
            tgt[i + 2 * numThreads] = src[srcY * srcWidth + ((srcX + 2 * numThreads) % srcWidth)];
        }
        if (i + 3 * numThreads < tgtWidth * tgtHeight) {
            tgt[i + 3 * numThreads] = src[srcY * srcWidth + ((srcX + 3 * numThreads) % srcWidth)];
        }
    }
}