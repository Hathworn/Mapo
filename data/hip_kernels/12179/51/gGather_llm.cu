#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gGather(float* denseData, float* sparseData, int* sparseIndices, int denseSize, int sparseSize, int offset) {
    int idx = blockDim.x * blockIdx.x + threadIdx.x;

    // Check bounds first to exit early
    if (idx < sparseSize) { 
        int adjustedIndex = sparseIndices[idx] + offset;
        
        // Ensure adjusted index is within valid range
        if (adjustedIndex >= 0 && adjustedIndex < denseSize) { 
            sparseData[idx] = denseData[adjustedIndex];
        }
    }
}