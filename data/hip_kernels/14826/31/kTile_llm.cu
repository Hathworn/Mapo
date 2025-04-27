#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTile(const float* src, float* tgt, const uint srcWidth, const uint srcHeight, const uint tgtWidth, const uint tgtHeight) {
    // Calculate flattened index for current thread
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const int numThreads = blockDim.x * gridDim.x;
    
    // Use shared memory to reduce global memory access (when applicable)
    __shared__ float sharedSrc[BLOCK_SIZE]; // Adjust BLOCK_SIZE as necessary
    
    // Calculate total number of elements
    const uint totalElements = tgtWidth * tgtHeight;
    
    // Loop over elements handled by this thread
    for (uint i = idx; i < totalElements; i += numThreads) {
        const uint y = i / tgtWidth;
        const uint x = i % tgtWidth;
        const uint srcY = y % srcHeight;
        const uint srcX = x % srcWidth;
        
        // Load relevant source data into shared memory
        if (threadIdx.x < srcWidth) {
            sharedSrc[threadIdx.x] = src[srcY * srcWidth + threadIdx.x];
        }
        __syncthreads(); // Synchronize to ensure data is loaded
        
        // Perform the tiling operation using shared memory
        tgt[i] = sharedSrc[srcX];
    }
}