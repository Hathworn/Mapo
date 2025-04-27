#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* src, float* tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    // Calculate global thread index
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const int numThreads = blockDim.x * gridDim.x;
    
    // Use shared memory for partial results to improve memory access efficiency
    extern __shared__ float sharedSrc[];

    // Cooperative loading of source into shared memory
    for (uint i = threadIdx.x; i < srcWidth * srcHeight; i += blockDim.x) {
        sharedSrc[i] = src[i];
    }
    __syncthreads();  // Ensure all thread loads into shared memory are complete
    
    // Iterate over the output elements
    for (uint i = idx; i < tgtWidth * tgtHeight; i += numThreads) {
        const uint y = i / tgtWidth;
        const uint x = i % tgtWidth;
        const uint srcY = y % srcHeight;
        const uint srcX = x % srcWidth;
        tgt[i] = sharedSrc[srcY * srcWidth + srcX];
    }
}