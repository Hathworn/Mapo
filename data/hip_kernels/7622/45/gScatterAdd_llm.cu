#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gScatterAdd(float* denseData, float* sparseData, int* sparseIndices, int denseSize, int sparseSize, int offset) {
    int idx = blockDim.x * blockIdx.x + threadIdx.x;

    // Check if idx is within the bounds to avoid unnecessary threads
    if(idx < sparseSize) {
        int index = sparseIndices[idx] + offset;
        
        // Check the calculated index once for bounds
        if(index >= 0 && index < denseSize) {
            atomicAdd(&denseData[index], sparseData[idx]); // Ensure safe concurrent writes
        }
    }
}