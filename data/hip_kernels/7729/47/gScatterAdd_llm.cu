#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gScatterAdd(float* denseData, float* sparseData, int* sparseIndices, int denseSize, int sparseSize, int offset) {
    int idx = blockDim.x * blockIdx.x + threadIdx.x;

    // Ensure only required threads perform operations
    if (idx < sparseSize) {
        int index = sparseIndices[idx] + offset;

        // Check bounds within the if statement to avoid calculating repeatedly
        if (index >= 0 && index < denseSize) {
            atomicAdd(&denseData[index], sparseData[idx]);
        }
    }
}