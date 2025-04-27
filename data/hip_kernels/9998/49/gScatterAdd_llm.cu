#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gScatterAdd(float* denseData, float* sparseData, int* sparseIndices, int denseSize, int sparseSize, int offset) {
    // Use a single variable to calculate the global index and ensure correct range
    int idx = blockDim.x * blockIdx.x + threadIdx.x;
    if(idx < sparseSize) {
        int denseIdx = sparseIndices[idx] + offset; // Calculate dense index once
        // Simplify conditional check and prevent out-of-bounds write
        if(denseIdx >= 0 && denseIdx < denseSize) {
            atomicAdd(&denseData[denseIdx], sparseData[idx]); // Use atomicAdd for thread safety
        }
    }
}