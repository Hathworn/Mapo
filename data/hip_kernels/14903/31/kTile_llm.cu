#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* __restrict__ src, float* __restrict__ tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const int numThreads = blockDim.x * gridDim.x;

    for (uint i = idx; i < tgtWidth * tgtHeight; i += numThreads) {
        // Calculate y and x using integer division and modulus for efficiency
        const uint y = i / tgtWidth;
        const uint x = i % tgtWidth;
        // Use integer modulus to map target indices to source indices
        const uint srcY = y % srcHeight;
        const uint srcX = x % srcWidth;
        // Directly index source and assign to target
        tgt[i] = src[srcY * srcWidth + srcX];
    }
}