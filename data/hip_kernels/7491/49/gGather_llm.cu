#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void gGather(float* denseData, float* sparseData, int* sparseIndices, int denseSize, int sparseSize, int offset) {
    int idx = blockDim.x * blockIdx.x + threadIdx.x;
    if (idx < sparseSize) {  // Consolidated boundary check
        int index = sparseIndices[idx] + offset;  // Precompute combined index
        if (index >= 0 && index < denseSize) {  // Use precomputed index and simplified condition
            sparseData[idx] = denseData[index];
        }
    }
}