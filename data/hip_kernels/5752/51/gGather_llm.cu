#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gGather(float* denseData, float* sparseData, int* sparseIndices, int denseSize, int sparseSize, int offset) {
    int idx = blockDim.x * blockIdx.x + threadIdx.x;

    // Optimization: Use grid-stride loop for better load balancing
    for (; idx < sparseSize; idx += gridDim.x * blockDim.x) {
        int sparseIdx = sparseIndices[idx] + offset;
        
        // Ensure sparseIdx is within bounds before accessing
        if (sparseIdx >= 0 && sparseIdx < denseSize) {
            sparseData[idx] = denseData[sparseIdx];
        }
    }
}