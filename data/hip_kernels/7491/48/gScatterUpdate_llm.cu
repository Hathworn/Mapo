#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gScatterUpdate(float* denseData, float* sparseData, int* sparseIndices, int denseSize, int sparseSize, int offset) {
    int idx = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Ensure thread index is within bounds
    if (idx < sparseSize) {
        // Calculate the position to update in denseData
        int denseIndex = sparseIndices[idx] + offset;
        // Ensure the calculated index is within valid range
        if (denseIndex >= 0 && denseIndex < denseSize) {
              denseData[denseIndex] = sparseData[idx];
        }
    }
}