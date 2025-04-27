#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gScatterUpdate(float* denseData, float* sparseData, int* sparseIndices, int denseSize, int sparseSize, int offset) {
    int idx = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Use shared memory for improved memory access efficiency
    __shared__ int sharedSparseIndices[256];  // Assuming max blockDim.x of 256, adjust as necessary
    __shared__ float sharedSparseData[256];
    
    if (idx < sparseSize) {
        sharedSparseIndices[threadIdx.x] = sparseIndices[idx];
        sharedSparseData[threadIdx.x] = sparseData[idx];
    }
    
    __syncthreads();  // Ensure shared memory is populated

    if(idx < sparseSize) {
        int index = sharedSparseIndices[threadIdx.x];
        if(index >= -offset && index + offset < denseSize) {
            denseData[index + offset] = sharedSparseData[threadIdx.x];
        }
    }
}