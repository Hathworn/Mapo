#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* src, float* tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    // Compute unique thread index using block and thread index
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Calculate the total number of threads
    const int numThreads = blockDim.x * gridDim.x;
    // Loop over each target element assigned to this thread
    for (uint i = idx; i < tgtWidth * tgtHeight; i += numThreads) {
        // Calculate 2D coordinate in the target matrix
        const uint y = i / tgtWidth;
        const uint x = i % tgtWidth;
        // Map target coordinates to source coordinates using modulo
        const uint srcY = y % srcHeight;
        const uint srcX = x % srcWidth;
        // Assign value from source to target matrix
        tgt[i] = src[srcY * srcWidth + srcX];
    }
}