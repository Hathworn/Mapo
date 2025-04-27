#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gScatterAdd(float* denseData, float* sparseData, int* sparseIndices, int denseSize, int sparseSize, int offset) {
    // Calculate the global thread index
    int idx = blockDim.x * blockIdx.x + threadIdx.x;

    // Use a shared memory buffer to coalesce the access to denseData
    __shared__ float cache[256]; // Assuming optimal block size of 256

    if (idx < sparseSize) {
        int denseIndex = sparseIndices[idx] + offset;

        // Check bounds and perform scatter add
        if(denseIndex >= 0 && denseIndex < denseSize) {
            int cacheIndex = threadIdx.x;
            cache[cacheIndex] = sparseData[idx];

            // Use atomic add to ensure no race conditions occur
            atomicAdd(&denseData[denseIndex], cache[cacheIndex]);
        }
    }
}