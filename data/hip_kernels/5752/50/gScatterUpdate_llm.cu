#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gScatterUpdate(float* denseData, float* sparseData, int* sparseIndices, int denseSize, int sparseSize, int offset) {
    // Use shared memory to reduce global memory access for sparse indices within a block
    extern __shared__ int sharedSparseIndices[];
    
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < sparseSize) {
        sharedSparseIndices[threadIdx.x] = sparseIndices[idx];
        __syncthreads(); // Synchronize to ensure shared memory is populated

        int sparseIdx = sharedSparseIndices[threadIdx.x];
        int targetIdx = sparseIdx + offset;
        
        // Perform boundary check before updating dense data
        if(targetIdx >= 0 && targetIdx < denseSize) {
            denseData[targetIdx] = sparseData[idx];
        }
    }
}