#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gScatterAdd(float* denseData, float* sparseData, int* sparseIndices, int denseSize, int sparseSize, int offset) {
    int idx = blockDim.x * blockIdx.x + threadIdx.x;

    // Use shared memory for efficient access patterns
    __shared__ int sharedSparseIndices[BLOCK_DIM];
    __shared__ float sharedSparseData[BLOCK_DIM];

    if (idx < sparseSize) {
        // Load data into shared memory
        sharedSparseIndices[threadIdx.x] = sparseIndices[idx];
        sharedSparseData[threadIdx.x] = sparseData[idx];
        __syncthreads();

        // Check bounds and perform addition
        if (sharedSparseIndices[threadIdx.x] >= -offset && sharedSparseIndices[threadIdx.x] + offset < denseSize) {
            atomicAdd(&denseData[sharedSparseIndices[threadIdx.x] + offset], sharedSparseData[threadIdx.x]);
        }
    }
}