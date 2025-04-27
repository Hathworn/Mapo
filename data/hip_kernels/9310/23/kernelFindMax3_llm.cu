#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void kernelFindMax3(const int* dataArray, int arraySize, int* maxVal)
{
    extern __shared__ int cache[];

    int cacheIndex = threadIdx.x;
    int arrayIndex = blockDim.x * blockIdx.x + threadIdx.x;

    // Load data into shared memory with boundary check
    cache[cacheIndex] = (arrayIndex < arraySize) ? dataArray[arrayIndex] : INT_MIN;

    __syncthreads();

    // Reduction to find max using warp-wise reduction
    for (int offset = blockDim.x >> 1; offset > 0; offset >>= 1) 
    {
        if (cacheIndex < offset)
        {
            cache[cacheIndex] = max(cache[cacheIndex], cache[cacheIndex ^ offset]);
        }
        __syncthreads();
    }

    // Write result for this block to global memory
    if (cacheIndex == 0)
    {
        atomicMax(maxVal, cache[0]);
    }
}