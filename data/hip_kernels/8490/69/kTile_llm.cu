#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* __restrict__ src, float* __restrict__ tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const int numThreads = blockDim.x * gridDim.x;
    
    // Optimize loop using shared memory to reduce global memory access
    extern __shared__ float sharedSrc[];
    
    const uint srcSize = srcWidth * srcHeight;
    for (uint i = idx; i < srcSize; i += numThreads) {
        sharedSrc[i] = src[i];
    }
    __syncthreads();
    
    for (uint i = idx; i < tgtWidth * tgtHeight; i += numThreads) {
        const uint y = i / tgtWidth;
        const uint x = i % tgtWidth;
        const uint srcY = y % srcHeight;
        const uint srcX = x % srcWidth;
        const uint srcIdx = srcY * srcWidth + srcX;
        
        // Use shared memory to access the source element
        tgt[i] = sharedSrc[srcIdx];
    }
}