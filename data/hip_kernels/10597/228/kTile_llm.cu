#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* src, float* tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    // Calculate thread's unique id and total number of threads
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const int numThreads = blockDim.x * gridDim.x;

    const uint numEls = tgtWidth * tgtHeight;

    // Loop over elements with stride equal to the total number of threads
    for (uint i = idx; i < numEls; i += numThreads) {
        const uint y = i / tgtWidth;
        const uint x = i % tgtWidth;

        // Compute source indices using modulo to tile as necessary
        const uint srcY = y % srcHeight;
        const uint srcX = x % srcWidth;

        // Assign tiled element to the target
        tgt[i] = src[srcY * srcWidth + srcX];
    }
}