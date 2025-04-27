#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gScatterUpdate(float* denseData, float* sparseData, int* sparseIndices, int denseSize, int sparseSize, int offset) {
    // Calculate global thread index for the denseData update
    int idx = blockDim.x * blockIdx.x + threadIdx.x;

    // Ensure idx is within sparseSize bounds
    if(idx < sparseSize) {
        int targetIndex = sparseIndices[idx] + offset;

        // Optimize index range check using a simpler constraint
        if(targetIndex >= 0 && targetIndex < denseSize) {
            // Perform update only if targetIndex is valid
            denseData[targetIndex] = sparseData[idx];
        }
    }
}