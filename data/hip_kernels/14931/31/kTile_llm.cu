#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* src, float* tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    // Calculate global thread index
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Calculate total number of threads
    const int numThreads = blockDim.x * gridDim.x;

    // Loop through target elements, using step size equal to the number of threads
    for (uint i = idx; i < tgtWidth * tgtHeight; i += numThreads) {
        const uint y = i / tgtWidth;  // Determine y position in target
        const uint x = i % tgtWidth;  // Determine x position in target

        const uint srcY = y % srcHeight;  // Wrap y to source height
        const uint srcX = x % srcWidth;   // Wrap x to source width

        tgt[i] = src[srcY * srcWidth + srcX];  // Map source to target
    }
}