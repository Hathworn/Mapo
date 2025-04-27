#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* src, float* tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    // Calculate the thread's unique index
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Calculate the total number of threads
    const int numThreads = blockDim.x * gridDim.x;

    // Calculate the total number of elements
    const unsigned int numEls = tgtWidth * tgtHeight;

    // Process multiple elements per thread in each iteration
    for (uint i = idx; i < numEls; i += numThreads) {
        // Calculate the target's x and y coordinates
        const uint y = i / tgtWidth;
        const uint x = i % tgtWidth;

        // Calculate the corresponding source coordinates (tiled mapping)
        const uint srcY = y % srcHeight;
        const uint srcX = x % srcWidth;

        // Assign the source value to the target
        tgt[i] = src[srcY * srcWidth + srcX];
    }
}