#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* src, float* tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    // Use shared memory for enhanced memory access efficiency
    extern __shared__ float sharedSrc[];

    // Calculate global thread index
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const int numThreads = blockDim.x * gridDim.x;

    // Load data into shared memory
    for (uint ty = threadIdx.x; ty < srcHeight; ty += blockDim.x) {
        for (uint tx = 0; tx < srcWidth; ++tx) {
            sharedSrc[ty * srcWidth + tx] = src[ty * srcWidth + tx];
        }
    }
    __syncthreads();

    // Process tiles
    for (uint i = idx; i < tgtWidth * tgtHeight; i += numThreads) {
        const uint y = i / tgtWidth;
        const uint x = i % tgtWidth;
        const uint srcY = y % srcHeight;
        const uint srcX = x % srcWidth;
        tgt[i] = sharedSrc[srcY * srcWidth + srcX];
    }
}