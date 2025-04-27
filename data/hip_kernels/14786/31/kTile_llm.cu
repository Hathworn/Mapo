#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* src, float* tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    // Calculate the global index
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Calculate the number of threads for the whole grid
    const int numThreads = blockDim.x * gridDim.x;

    // Loop over target array elements using stride of total number of threads
    for (uint i = idx; i < tgtWidth * tgtHeight; i += numThreads) {
        // Calculate 2D target coordinates
        const uint y = i / tgtWidth;
        const uint x = i % tgtWidth;

        // Map target coordinates to source coordinates using modulo operation
        const uint srcY = y % srcHeight;
        const uint srcX = x % srcWidth;

        // Map source element to target
        tgt[i] = src[srcY * srcWidth + srcX];
    }
}