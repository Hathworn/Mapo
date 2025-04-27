#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* src, float* tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    // Calculate 1D global thread index
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Calculate total number of threads
    const int numThreads = blockDim.x * gridDim.x;
    // Loop over elements to process
    for (uint i = idx; i < tgtWidth * tgtHeight; i += numThreads) {
        // Calculate 2D coordinates in the target array
        const uint y = i / tgtWidth;
        const uint x = i % tgtWidth;
        // Map to 2D coordinates in the source array using modulo
        const uint srcY = y % srcHeight;
        const uint srcX = x % srcWidth;
        // Copy data from source to target with calculated indices
        tgt[i] = src[srcY * srcWidth + srcX];
    }
}