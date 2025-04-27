#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* src, float* tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    // Calculate the global index of the thread
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Calculate the total number of threads
    const int numThreads = blockDim.x * gridDim.x;

    // Loop over target elements with stride equal to the total number of threads
    for (uint i = idx; i < tgtWidth * tgtHeight; i += numThreads) {
        // Compute the y and x indices for the target
        const uint y = i / tgtWidth;
        const uint x = i % tgtWidth;
        // Calculate the y and x indices for the source based on the modulo operation
        const uint srcY = y % srcHeight;
        const uint srcX = x % srcWidth;
        // Assign the source value to the target
        tgt[i] = src[srcY * srcWidth + srcX];
    }
}