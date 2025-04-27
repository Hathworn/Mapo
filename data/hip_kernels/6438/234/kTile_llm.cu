```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* __restrict__ src, float* __restrict__ tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    // Calculate the global index for each thread
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const int numThreads = blockDim.x * gridDim.x;

    // Loop through the target elements each thread will handle
    for (uint i = idx; i < tgtWidth * tgtHeight; i += numThreads) {
        // Calculate the corresponding source indices
        const uint y = i / tgtWidth;
        const uint x = i % tgtWidth;
        const uint srcY = y % srcHeight;
        const uint srcX = x % srcWidth;
        
        // Perform copying from source to target with strided access
        tgt[i] = src[srcY * srcWidth + srcX];
    }
}