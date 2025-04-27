```c
#include "hip/hip_runtime.h"
#include "includes.h"

// Improved kernel with coalesced memory access
__global__ void gGather(float* denseData, float* sparseData, int* sparseIndices, int denseSize, int sparseSize, int offset) {
    int idx = blockDim.x * blockIdx.x + threadIdx.x;

    // Ensure idx is within bounds
    if(idx < sparseSize) {
        int sparseIdx = sparseIndices[idx] + offset;

        // Check boundaries for valid memory access
        if(sparseIdx >= 0 && sparseIdx < denseSize) {
            sparseData[idx] = denseData[sparseIdx];
        }
    }
}