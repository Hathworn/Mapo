#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* __restrict__ src, float* __restrict__ tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const int numThreads = blockDim.x * gridDim.x;
    
    for (uint i = idx; i < tgtWidth * tgtHeight; i += numThreads) {
        const uint y = i / tgtWidth;
        const uint x = i % tgtWidth;
        const uint srcY = y % srcHeight;
        const uint srcX = x % srcWidth;
	// Use shared memory to improve memory access performance
        extern __shared__ float sharedSrc[];
        if (idx < srcHeight * srcWidth) {
            sharedSrc[idx] = src[idx];
        }
        __syncthreads();
        tgt[i] = sharedSrc[srcY * srcWidth + srcX];
    }
}