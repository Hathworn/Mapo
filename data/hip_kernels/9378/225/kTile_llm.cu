#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* src, float* tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    // Calculate the global thread index
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Total number of elements in the target matrix
    const unsigned int numEls = tgtWidth * tgtHeight;

    // Optimize access by processing contiguous memory regions
    const int threadCount = blockDim.x * gridDim.x;
    for (uint i = idx; i < numEls; i += threadCount) {
        const uint y = i / tgtWidth;
        const uint x = i % tgtWidth;
        const uint srcY = y % srcHeight;
        const uint srcX = x % srcWidth;
        
        // Fetch from source matrix and store in the target matrix
        tgt[i] = src[srcY * srcWidth + srcX];
    }
}