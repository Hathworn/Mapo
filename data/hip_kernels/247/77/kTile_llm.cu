#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* src, float* tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    // Calculate the unique global thread index
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const int numThreads = blockDim.x * gridDim.x;
    
    // Loop through the target array using a step size equal to the total number of threads
    for (uint i = idx; i < tgtWidth * tgtHeight; i += numThreads) {
        // Calculate the original source coordinates using modulo and division
        const uint srcY = (i / tgtWidth) % srcHeight;
        const uint srcX = (i % tgtWidth) % srcWidth;
        // Assign the value from the source to the target array
        tgt[i] = src[srcY * srcWidth + srcX];
    }
}