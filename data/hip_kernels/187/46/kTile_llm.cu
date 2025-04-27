```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* src, float* tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    // Compute a unique thread index using block and thread indices
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const int numThreads = blockDim.x * gridDim.x;
    
    // Unrolling loop to reduce overhead and improve performance
    #pragma unroll
    for (uint i = idx; i < tgtWidth * tgtHeight; i += numThreads) {
        // Calculate positions in the target and source arrays
        const uint y = i / tgtWidth;
        const uint x = i % tgtWidth;
        const uint srcY = y % srcHeight;
        const uint srcX = x % srcWidth;
        // Copy from source to target
        tgt[i] = src[srcY * srcWidth + srcX];
    }
}