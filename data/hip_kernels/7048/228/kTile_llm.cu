#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* __restrict__ src, float* __restrict__ tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const int numThreads = blockDim.x * gridDim.x;
    
    // Use __restrict__ to indicate no aliasing for better optimization
    // Use loop unrolling for enhanced parallel efficiency
    for (uint i = idx; i < tgtWidth * tgtHeight; i += numThreads) {
        const uint y = i / tgtWidth;
        const uint x = i % tgtWidth;
        const uint srcY = y % srcHeight;
        const uint srcX = x % srcWidth;
        tgt[i] = __ldg(&src[srcY * srcWidth + srcX]); // Use __ldg for fast cache reads
    }
}