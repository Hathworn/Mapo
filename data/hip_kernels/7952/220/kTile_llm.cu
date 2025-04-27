#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* src, float* tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    // Get the global thread ID
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const int numThreads = blockDim.x * gridDim.x;

    // Utilize shared memory for optimal memory access
    extern __shared__ float sharedSrc[];
    const uint sharedIndex = threadIdx.x;

    // Each thread loads a single element into shared memory
    if (sharedIndex < srcWidth * srcHeight) {
      sharedSrc[sharedIndex] = src[sharedIndex];
    }
    __syncthreads();

    // Calculate target index and map it to the source matrix
    for (uint i = idx; i < tgtWidth * tgtHeight; i += numThreads) {
        const uint y = i / tgtWidth;
        const uint x = i % tgtWidth;
        const uint srcY = y % srcHeight;
        const uint srcX = x % srcWidth;
        tgt[i] = sharedSrc[srcY * srcWidth + srcX];
    }
}