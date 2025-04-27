#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gScatterAdd(float* denseData, float* sparseData, int* sparseIndices, int denseSize, int sparseSize, int offset) {
    int idx = blockDim.x * blockIdx.x + threadIdx.x;

    // Ensure idx is within bounds of sparseSize
    if (idx < sparseSize) {
        int sparseIndex = sparseIndices[idx] + offset;

        // Check if sparseIndex is within dense bounds
        if (sparseIndex >= 0 && sparseIndex < denseSize) {
            // Atomic operation for thread-safe addition
            atomicAdd(&denseData[sparseIndex], sparseData[idx]);
        }
    }
}