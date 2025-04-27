#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* src, float* tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const int numThreads = blockDim.x * gridDim.x;

    // Use shared memory to reduce repetitive accesses to global memory
    __shared__ float tileCache[1024];
    
    for (uint i = idx; i < tgtWidth * tgtHeight; i += numThreads) {
        const uint y = i / tgtWidth;
        const uint x = i % tgtWidth;
        const uint srcY = y % srcHeight;
        const uint srcX = x % srcWidth;
        
        // Load a tile into shared memory (assuming the size fits)
        if (threadIdx.x < srcWidth * srcHeight) {
            tileCache[threadIdx.x] = src[threadIdx.x];
        }
        __syncthreads();
        
        // Use the cached value from shared memory
        tgt[i] = tileCache[srcY * srcWidth + srcX];
    }
}