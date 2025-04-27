#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* src, float* tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const int totalThreads = blockDim.x * gridDim.x;

    // Use shared memory for performance improvement
    __shared__ float sharedSrc[blockDim.x];
    
    for (uint i = idx; i < tgtWidth * tgtHeight; i += totalThreads) {
        const uint y = i / tgtWidth;
        const uint x = i % tgtWidth;
        const uint srcY = y % srcHeight;
        const uint srcX = x % srcWidth;

        // Load data into shared memory using cooperative threads
        if (threadIdx.x < srcWidth) {
            sharedSrc[threadIdx.x] = src[srcY * srcWidth + srcX];
        }
        __syncthreads();  // Synchronize threads before proceeding
        
        // Access data from shared memory
        tgt[i] = sharedSrc[srcX];
    }
}