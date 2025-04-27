#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* __restrict__ src, float* __restrict__ tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    // Utilize shared memory for loading source data to reduce global memory access
    extern __shared__ float sharedSrc[];

    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const int numThreads = blockDim.x * gridDim.x;
    
    // Preload source data into shared memory
    for (uint i = threadIdx.x; i < srcWidth * srcHeight; i += blockDim.x) {
        sharedSrc[i] = src[i];
    }

    __syncthreads(); // Ensure all threads have loaded the data

    for (uint i = idx; i < tgtWidth * tgtHeight; i += numThreads) {
        const uint y = i / tgtWidth;
        const uint x = i % tgtWidth;
        const uint srcY = y % srcHeight;
        const uint srcX = x % srcWidth;
        tgt[i] = sharedSrc[srcY * srcWidth + srcX];
    }
}