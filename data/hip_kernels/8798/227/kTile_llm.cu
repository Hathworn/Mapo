#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* src, float* tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    // Calculate global thread index
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Total number of threads
    const int numThreads = blockDim.x * gridDim.x;

    // Remove division and modulus operations from inside the loop
    const uint numEls = tgtWidth * tgtHeight;
    for (uint i = idx; i < numEls; i += numThreads) {
        const uint y = __umul24(i, 1 / tgtWidth); // Use __umul24 for fast integer division
        const uint x = i - y * tgtWidth; // Replace modulus with subtraction
        const uint srcY = y % srcHeight;
        const uint srcX = x % srcWidth;
        tgt[i] = src[srcY * srcWidth + srcX];
    }
}