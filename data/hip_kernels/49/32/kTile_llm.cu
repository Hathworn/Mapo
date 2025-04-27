#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kTile(const float* __restrict__ src, float* __restrict__ tgt, const int srcWidth, const int srcHeight, const int tgtWidth, const int tgtHeight) {
    // Calculate global thread index
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Calculate total number of threads
    const int numThreads = blockDim.x * gridDim.x;
    // Iterate over elements with stride of numThreads
    for (unsigned int i = idx; i < tgtWidth * tgtHeight; i += numThreads) {
        // Calculate target indices
        const int y = i / tgtWidth;
        const int x = i % tgtWidth;
        // Calculate source indices using modulo for tiling
        const int srcY = y % srcHeight;
        const int srcX = x % srcWidth;
        // Directly map tiling from src to tgt
        tgt[i] = src[srcY * srcWidth + srcX];
    }
}