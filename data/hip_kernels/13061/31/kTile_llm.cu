#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(float* src, float* tgt, unsigned int srcWidth, unsigned int srcHeight, unsigned int tgtWidth, unsigned int tgtHeight) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;

    // Use faster integer arithmetic for index calculations
    for (unsigned int i = idx; i < tgtWidth * tgtHeight; i += numThreads) {
        const unsigned int srcY = (i / tgtWidth) % srcHeight;
        const unsigned int srcX = (i % tgtWidth) % srcWidth;
        tgt[i] = src[srcY * srcWidth + srcX];
    }
}