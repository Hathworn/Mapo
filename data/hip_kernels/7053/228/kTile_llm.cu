#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* src, float* tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    // Calculate the global index
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Calculate total number of threads
    const int numThreads = blockDim.x * gridDim.x;
    // Precompute the total number of elements to reduce computations inside the loop
    const uint numEls = tgtWidth * tgtHeight;

    for (uint i = idx; i < numEls; i += numThreads) {
        // Use division and modulus to determine x and y coordinates
        const uint y = i / tgtWidth;
        const uint x = i % tgtWidth;
        // Utilize modulo operations to handle repetition over source dimensions
        const uint srcY = y % srcHeight;
        const uint srcX = x % srcWidth;
        // Assign the corresponding value from the source to the target
        tgt[i] = src[srcY * srcWidth + srcX];
    }
}