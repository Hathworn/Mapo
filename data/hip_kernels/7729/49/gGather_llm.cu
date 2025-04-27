#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gGather(float* denseData, float* sparseData, int* sparseIndices, int denseSize, int sparseSize, int offset) {
    // Calculate the global index
    int idx = blockDim.x * blockIdx.x + threadIdx.x;

    // Ensure the thread operates within bounds
    if (idx < sparseSize) {
        int index = sparseIndices[idx] + offset;
        // Check bounds for accessing dense data
        if (index >= 0 && index < denseSize) {
            sparseData[idx] = denseData[index];
        }
    }
}