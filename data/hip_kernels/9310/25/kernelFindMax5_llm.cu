```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void kernelFindMax5(const int* dataArray, int arraySize, int* maxVal)
{
    // Use dynamic shared memory allocation
    extern __shared__ int cache[];

    int cacheIndex = threadIdx.x;

    // Calculate two array indices for the thread
    int arrayIndex1 = blockDim.x * blockIdx.x + threadIdx.x;
    int arrayIndex2 = arrayIndex1 + gridDim.x * blockDim.x;

    // Initialize shared memory to minimum integer value
    int threadMax = INT_MIN;

    // Load data into shared memory
    if (arrayIndex1 < arraySize)
    {
        threadMax = max(threadMax , dataArray[arrayIndex1]);
    }

    if (arrayIndex2 < arraySize)
    {
        threadMax = max(threadMax , dataArray[arrayIndex2]);
    }
    
    // Store the maximum found by this thread
    cache[cacheIndex] = threadMax;
    
    __syncthreads();

    // Parallel reduction to find block's max
    for (int offset = blockDim.x >> 1; offset > 0; offset >>= 1)
    {
        if (cacheIndex < offset)
        {
            cache[cacheIndex] = max(cache[cacheIndex], cache[cacheIndex + offset]);
        }
        __syncthreads();
    }

    // Write result for this block to global memory
    if (cacheIndex == 0)
    {
        atomicMax(maxVal, cache[0]);
    }
}