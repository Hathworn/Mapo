#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gScatterUpdate(float* denseData, float* sparseData, int* sparseIndices, int denseSize, int sparseSize, int offset) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Exit if idx is out of sparseSize bounds
    if (idx >= sparseSize) return;

    int index = sparseIndices[idx] + offset;
    
    // Check bounds and perform update in a single conditional
    if (index >= 0 && index < denseSize) {
        denseData[index] = sparseData[idx];
    }
}