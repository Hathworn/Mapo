#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* __restrict__ src, float* __restrict__ tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    // Calculate unique thread index
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Calculate total number of threads
    const int numThreads = blockDim.x * gridDim.x;

    // Loop over the output elements, step by the number of threads
    for (uint i = idx; i < tgtWidth * tgtHeight; i += numThreads) {
        // Pre-compute indices for better memory access pattern
        const uint y = i / tgtWidth;
        const uint x = i % tgtWidth;
        const uint srcY = y % srcHeight;
        const uint srcX = x % srcWidth;

        // Ensure coalesced memory access by reading from global memory with calculated indices
        tgt[i] = src[srcY * srcWidth + srcX];
    }
}