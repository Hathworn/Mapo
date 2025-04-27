#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gScatterUpdate(float* denseData, float* sparseData, int* sparseIndices, int denseSize, int sparseSize, int offset) {
    // Calculate global index once
    int idx = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Early exit for out-of-bounds threads
    if(idx >= sparseSize) return;
    
    // Store index calculation in a variable to avoid redundant computation
    int targetIndex = sparseIndices[idx] + offset;
    
    // Check boundaries
    if(sparseIndices[idx] >= -offset && targetIndex < denseSize) {
        // Perform scatter update
        denseData[targetIndex] = sparseData[idx];
    }
}