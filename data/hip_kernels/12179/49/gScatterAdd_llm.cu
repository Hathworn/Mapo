#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gScatterAdd(float* denseData, float* sparseData, int* sparseIndices, int denseSize, int sparseSize, int offset) {
    // Calculate thread's unique global index
    int idx = blockDim.x * blockIdx.x + threadIdx.x;

    // Use stride loop to handle out-of-bound indices and improve ILP
    for (int i = idx; i < sparseSize; i += gridDim.x * blockDim.x) {
        // Check bounds before updating to ensure safety
        if (sparseIndices[i] >= -offset && sparseIndices[i] + offset < denseSize) {
            atomicAdd(&denseData[sparseIndices[i] + offset], sparseData[i]);
        }
    }
}