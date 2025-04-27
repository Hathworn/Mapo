#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void kernelFindMax4(const int* dataArray, int arraySize, int* maxVal)
{
    __shared__ extern int cache[];

    int cacheIndex = threadIdx.x;
    int arrayIndex1 = blockDim.x * blockIdx.x + threadIdx.x;
    int arrayIndex2 = arrayIndex1 + gridDim.x * blockDim.x;

    // Initialize shared memory to minimum integer value
    cache[cacheIndex] = INT_MIN;

    // Load data from global memory and compute max into shared memory
    if (arrayIndex1 < arraySize) {
        cache[cacheIndex] = max(cache[cacheIndex], dataArray[arrayIndex1]);
    }
    if (arrayIndex2 < arraySize) {
        cache[cacheIndex] = max(cache[cacheIndex], dataArray[arrayIndex2]);
    }

    __syncthreads();

    // Intra-block reduction to find maximum within block
    for (int offset = blockDim.x / 2; offset > 0; offset /= 2) {
        if (cacheIndex < offset) {
            cache[cacheIndex] = max(cache[cacheIndex], cache[cacheIndex + offset]);
        }
        __syncthreads();
    }

    // Atomic operation to update global maximum
    if (cacheIndex == 0) {
        atomicMax(maxVal, cache[0]);
    }
}