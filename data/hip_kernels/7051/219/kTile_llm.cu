#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* __restrict__ src, float* __restrict__ tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    // Calculate the global thread index
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Calculate the total number of threads
    const int numThreads = blockDim.x * gridDim.x;
    
    // Loop over each element assigned to this thread
    for (uint i = idx; i < tgtWidth * tgtHeight; i += numThreads) {
        // Calculate coordinates on the target matrix
        const uint y = i / tgtWidth;
        const uint x = i % tgtWidth;
        // Calculate the corresponding coordinates on the source matrix
        const uint srcY = y % srcHeight;
        const uint srcX = x % srcWidth;
        
        // Write the value from the source matrix to the target matrix
        tgt[i] = src[srcY * srcWidth + srcX];
    }
}