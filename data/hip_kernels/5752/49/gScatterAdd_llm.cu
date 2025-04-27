#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gScatterAdd(float* denseData, float* sparseData, int* sparseIndices, int denseSize, int sparseSize, int offset) {
    // Use shared memory for indices to reduce global memory access
    __shared__ int sharedSparseIndices[1024];

    int idx = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Check bounds and load sparse indices into shared memory
    if (idx < sparseSize) {
        sharedSparseIndices[threadIdx.x] = sparseIndices[idx];
    }
    __syncthreads();

    // Ensure only threads within bounds perform addition
    if (idx < sparseSize) {
        int index = sharedSparseIndices[threadIdx.x];
        if (index >= -offset && index + offset < denseSize) {
            // Use atomic operation to avoid race conditions in parallel modification
            atomicAdd(&denseData[index + offset], sparseData[idx]);
        }
    }
}