#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gScatterUpdate(float* denseData, float* sparseData, int* sparseIndices, int denseSize, int sparseSize, int offset) {
    // Calculate flattened global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Use branchless logic for bounds checking
    if (idx < sparseSize) {
        int sparseIndex = sparseIndices[idx] + offset;
        if (sparseIndex >= 0 && sparseIndex < denseSize) {
            // Perform scatter update
            denseData[sparseIndex] = sparseData[idx];
        }
    }
}