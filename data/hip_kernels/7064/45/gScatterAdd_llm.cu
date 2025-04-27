#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gScatterAdd(float* denseData, float* sparseData, int* sparseIndices, int denseSize, int sparseSize, int offset) {
    int idx = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Ensure idx is within bounds of sparseSize
    if (idx < sparseSize) {
        int sparseIdx = sparseIndices[idx] + offset;
        
        // Check bounds for denseData updates
        if (sparseIdx >= 0 && sparseIdx < denseSize) {
            atomicAdd(&denseData[sparseIdx], sparseData[idx]); // Use atomicAdd for thread safety
        }
    }
}