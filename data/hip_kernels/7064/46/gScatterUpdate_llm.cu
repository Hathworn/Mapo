#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gScatterUpdate(float* denseData, float* sparseData, int* sparseIndices, int denseSize, int sparseSize, int offset) {
    int idx = blockDim.x * blockIdx.x + threadIdx.x;
    if(idx < sparseSize) { // Combine condition check into a single if statement
        int denseIdx = sparseIndices[idx] + offset; // Precompute dense index
        if(denseIdx >= 0 && denseIdx < denseSize) { // Simplified boundary check
            denseData[denseIdx] = sparseData[idx];
        }
    }
}