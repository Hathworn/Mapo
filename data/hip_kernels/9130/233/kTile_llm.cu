#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* __restrict__ src, float* __restrict__ tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const int numThreads = blockDim.x * gridDim.x;

    // Utilize shared memory for better performance when accessing src
    extern __shared__ float sharedSrc[];
    for (uint i = threadIdx.x; i < srcWidth * srcHeight; i += blockDim.x) {
        sharedSrc[i] = src[i];
    }
    __syncthreads();

    for (uint i = idx; i < tgtWidth * tgtHeight; i += numThreads) {
        const uint y = i / tgtWidth;
        const uint x = i % tgtWidth;
        const uint srcY = y % srcHeight;
        const uint srcX = x % srcWidth;
        
        // Use shared memory for the source data access
        tgt[i] = sharedSrc[srcY * srcWidth + srcX];
    }
}