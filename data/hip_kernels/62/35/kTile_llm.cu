#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* __restrict__ src, float* __restrict__ tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const int numThreads = blockDim.x * gridDim.x;
    const unsigned int numEls = tgtWidth * tgtHeight;

    // Use shared memory for better memory access patterns
    __shared__ float sharedSrc[32 * 32]; // Example size, adjust according to actual usage

    for (uint i = idx; i < numEls; i += numThreads) {
        const uint y = i / tgtWidth;
        const uint x = i % tgtWidth;
        const uint srcY = y % srcHeight;
        const uint srcX = x % srcWidth;

        // Load elements into shared memory
        if (srcY * srcWidth + srcX < srcWidth * srcHeight) {
            sharedSrc[threadIdx.x] = src[srcY * srcWidth + srcX];
            __syncthreads(); // Synchronize to ensure all threads have loaded their elements
            tgt[i] = sharedSrc[threadIdx.x];
        }
    }
}