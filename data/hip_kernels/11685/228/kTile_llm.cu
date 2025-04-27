#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* src, float* tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    // Calculate global thread index
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Precompute total number of threads to avoid recomputation
    const int numThreads = blockDim.x * gridDim.x;
    // Loop over elements this thread is responsible for
    for (uint i = idx; i < tgtWidth * tgtHeight; i += numThreads) {
        // Use integer division and modulus to determine the target x, y and corresponding source x, y
        const uint y = i / tgtWidth;
        const uint x = i % tgtWidth;
        const uint srcY = y % srcHeight;
        const uint srcX = x % srcWidth;
        // Load and store operation
        tgt[i] = src[srcY * srcWidth + srcX];
    }
}