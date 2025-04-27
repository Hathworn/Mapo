#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* src, float* tgt, const int srcWidth, const int srcHeight, const int tgtWidth, const int tgtHeight) {
    // Calculate global thread index
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Calculate total number of threads
    const int numThreads = blockDim.x * gridDim.x;
    const int totalElements = tgtWidth * tgtHeight;

    // Loop with stride pattern to cover all elements
    for (unsigned int i = idx; i < totalElements; i += numThreads) {
        // Calculate y and x for the target matrix
        const int y = i / tgtWidth;
        const int x = i % tgtWidth;
        // Wrap y and x around the source matrix
        const int srcY = y % srcHeight;
        const int srcX = x % srcWidth;
        // Map source to target
        tgt[i] = src[srcY * srcWidth + srcX];
    }
}