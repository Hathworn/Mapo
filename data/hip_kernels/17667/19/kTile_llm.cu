#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* src, float* tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    // Calculate the global thread index
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const int stride = blockDim.x * gridDim.x;  // Calculate the stride

    // Loop over the target array in steps of stride
    for (uint i = idx; i < tgtWidth * tgtHeight; i += stride) {
        const uint y = i / tgtWidth;  // Calculate y-coordinate in target
        const uint x = i % tgtWidth;  // Calculate x-coordinate in target
        const uint srcY = y % srcHeight;  // Wrap y-coordinate within source height
        const uint srcX = x % srcWidth;  // Wrap x-coordinate within source width
        tgt[i] = src[srcY * srcWidth + srcX];  // Tile the source into target
    }
}