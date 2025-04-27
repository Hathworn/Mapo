```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gGather(float* denseData, float* sparseData, int* sparseIndices, int denseSize, int sparseSize, int offset) {
    int idx = blockDim.x * blockIdx.x + threadIdx.x;
    if(idx < sparseSize) { // Combine conditions to reduce branching
        int effectiveIndex = sparseIndices[idx] + offset; // Calculate this once
        if(effectiveIndex >= 0 && effectiveIndex < denseSize) { // Simplified boundary check
            sparseData[idx] = denseData[effectiveIndex];
        }
    }
}