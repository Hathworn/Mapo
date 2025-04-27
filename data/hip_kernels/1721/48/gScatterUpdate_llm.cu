#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gScatterUpdate(float* denseData, float* sparseData, int* sparseIndices, int denseSize, int sparseSize, int offset) {
    int idx = blockDim.x * blockIdx.x + threadIdx.x;

    // Use shared memory to minimize global memory accesses
    __shared__ int sharedSparseIndices[1024];  // Assuming blockDim.x <= 1024
    __shared__ float sharedSparseData[1024];

    if (idx < sparseSize) {
        sharedSparseIndices[threadIdx.x] = sparseIndices[idx];
        sharedSparseData[threadIdx.x] = sparseData[idx];

        __syncthreads();

        int index = sharedSparseIndices[threadIdx.x];
        if (index >= -offset && index + offset < denseSize) {
            denseData[index + offset] = sharedSparseData[threadIdx.x];
        }
    }
}