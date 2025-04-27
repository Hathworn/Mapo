#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void kernelCalcSum_ShareMem(const int* dataArray, int arraySize, int* sum)
{
    __shared__ int cache[1024]; // Use fixed shared memory size for known dimensions.

    int cacheIndex = threadIdx.x;
    int arrayIndex = blockDim.x * blockIdx.x + threadIdx.x;

    cache[cacheIndex] = (arrayIndex < arraySize) ? dataArray[arrayIndex] : 0; // Simplify conditional store.
    __syncthreads();

    for (int offset = blockDim.x / 2; offset > 0; offset >>= 1) // Reduce in shared memory.
    {
        if (cacheIndex < offset)
        {
            cache[cacheIndex] += cache[cacheIndex + offset];
        }
        __syncthreads();
    }

    if (cacheIndex == 0)
    {
        atomicAdd(sum, cache[0]); // Efficient atomic addition for final sum.
    }
}