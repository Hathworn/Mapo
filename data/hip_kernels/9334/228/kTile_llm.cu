#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* src, float* tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    // Calculate the linear index of the current thread in the grid
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Calculate total number of threads
    const int numThreads = blockDim.x * gridDim.x;
    
    // Loop through target elements in steps of numThreads for coalesced memory access
    for (uint i = idx; i < tgtWidth * tgtHeight; i += numThreads) {
        // Avoid division/remainder for y/x calculation by using intrinsic functions to improve performance
        const uint y = __hip_divider(i, tgtWidth);
        const uint x = __hip_remainder(i, tgtWidth);
        
        // Calculate source indices using modulus for tiling
        const uint srcY = y % srcHeight;
        const uint srcX = x % srcWidth;
        
        // Perform tiling operation
        tgt[i] = src[srcY * srcWidth + srcX];
    }
}