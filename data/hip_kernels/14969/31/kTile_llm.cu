#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kTile(const float* __restrict__ src, float* __restrict__ tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const int numThreads = blockDim.x * gridDim.x;
    const uint totalElements = tgtWidth * tgtHeight;

    // Use shared memory to reduce global memory access
    __shared__ float tile[blockDim.x];

    for (uint i = idx; i < totalElements; i += numThreads) {
        const uint y = i / tgtWidth;
        const uint x = i % tgtWidth;
        const uint srcY = y % srcHeight;
        const uint srcX = x % srcWidth;
        
        // Prefetch data to shared memory
        tile[threadIdx.x] = src[srcY * srcWidth + srcX];
        __syncthreads();

        // Write the prefetched data to global memory
        tgt[i] = tile[threadIdx.x];
    }
}