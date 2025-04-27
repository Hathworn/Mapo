#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* src, float* tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    // Compute unique global thread index
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Calculate total number of threads in the grid
    const int numThreads = blockDim.x * gridDim.x;

    // Loop over each element using stride loop pattern for better utilization
    for (uint i = idx; i < tgtWidth * tgtHeight; i += numThreads) {
        // Compute 2D target array coordinates
        const uint y = i / tgtWidth;
        const uint x = i % tgtWidth;
        // Map target coordinates to source coordinates
        const uint srcY = y % srcHeight;
        const uint srcX = x % srcWidth;
        // Copy data from source to target
        tgt[i] = src[srcY * srcWidth + srcX];
    }
}