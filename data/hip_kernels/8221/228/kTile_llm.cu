#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* src, float* tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    // Calculate global thread index
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Flatten source image height and stride
    const uint srcStride = srcWidth;

    // Total number of threads
    const int numThreads = blockDim.x * gridDim.x;
    
    // Iterate over target indices this thread is responsible for
    for (uint i = idx; i < tgtWidth * tgtHeight; i += numThreads) {
        // Calculate target coordinate
        const uint y = i / tgtWidth;
        const uint x = i % tgtWidth;
        
        // Compute corresponding source coordinates
        const uint srcY = y % srcHeight;
        const uint srcX = x % srcWidth;

        // Map the pixel from source to target
        tgt[i] = src[srcY * srcStride + srcX];
    }
}
```
