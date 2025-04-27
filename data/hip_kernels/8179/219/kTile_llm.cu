#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* src, float* tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const int numThreads = blockDim.x * gridDim.x;

    // Use shared memory for block-wise src fetching
    __shared__ float tile[1024]; // Assuming block size does not exceed 1024 threads
    
    for (uint i = idx; i < tgtWidth * tgtHeight; i += numThreads) {
        const uint y = i / tgtWidth;
        const uint x = i % tgtWidth;
        const uint srcY = y % srcHeight;
        const uint srcX = x % srcWidth;
        
        // Coalesced read from global to shared memory
        if (threadIdx.x < srcWidth * srcHeight) {
            tile[threadIdx.x] = src[srcY * srcWidth + srcX];
        }
        __syncthreads();

        // Write to global memory using data from shared memory
        tgt[i] = tile[(srcY % srcHeight) * srcWidth + (srcX % srcWidth)];
        __syncthreads();
    }
}