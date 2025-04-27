#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void kernelCalcSum_EffectiveShareAccess(const int* dataArray, int arraySize, int* sum)
{
    __shared__ int cache[1024]; // Predefined shared memory size for optimization

    int cacheIndex = threadIdx.x;

    int arrayIndex = blockDim.x * blockIdx.x + threadIdx.x;
    int value = (arrayIndex < arraySize) ? dataArray[arrayIndex] : 0;

    cache[cacheIndex] = value;

    __syncthreads();

    for (int offset = blockDim.x / 2; offset > 0; offset >>= 1)
    {
        if (cacheIndex < offset)
        {
            cache[cacheIndex] += cache[cacheIndex + offset]; // Fixed addressing for coalesced access
        }
        __syncthreads();
    }

    if (cacheIndex == 0)
    {
        atomicAdd(sum, cache[0]);
    }
}