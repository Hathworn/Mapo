#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* __restrict__ src, float* __restrict__ tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    // Calculate the global thread index
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const int numThreads = blockDim.x * gridDim.x;
    
    // Loop over all elements with stride of total number of threads
    for (uint i = idx; i < tgtWidth * tgtHeight; i += numThreads) {
        // Calculate 2D indices from the linear index for target array
        const uint y = i / tgtWidth;
        const uint x = i % tgtWidth;

        // Get corresponding source indices using modulo
        const uint srcY = y % srcHeight;
        const uint srcX = x % srcWidth;

        // Assign value from source to target
        tgt[i] = src[srcY * srcWidth + srcX];
    }
}