#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel by reducing divergence and accessing memory coalesced
__global__ void gGather(float* denseData, float* sparseData, int* sparseIndices, int denseSize, int sparseSize, int offset) {
    int idx = blockDim.x * blockIdx.x + threadIdx.x;
    // Use shared memory for faster data access
    __shared__ int sharedSparseIndices[1024]; // Adjust size as needed based on block size
    
    if (idx < sparseSize) {
        sharedSparseIndices[threadIdx.x] = sparseIndices[idx];
        __syncthreads(); // Ensure all threads have loaded their values
        
        int sparseIndex = sharedSparseIndices[threadIdx.x];
        if (sparseIndex >= -offset && sparseIndex + offset < denseSize) {
            sparseData[idx] = denseData[sparseIndex + offset];
        }
    }
}