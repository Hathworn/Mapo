#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void kernelCalcSum_EffectiveShareAccess_UnrolWarp(const int* dataArray, int arraySize, int* sum)
{
    __shared__ int cache[1024]; // Pre-allocate shared memory with a fixed size

    int cacheIndex = threadIdx.x;
    int arrayIndex1 = blockDim.x * blockIdx.x + threadIdx.x;
    int arrayIndex2 = arrayIndex1 + gridDim.x * blockDim.x;

    // Initialize cache using a single write per thread
    int tempSum = 0;
    if (arrayIndex1 < arraySize)
    {
        tempSum += dataArray[arrayIndex1];
    }

    if (arrayIndex2 < arraySize)
    {
        tempSum += dataArray[arrayIndex2];
    }
    cache[cacheIndex] = tempSum;

    __syncthreads();

    int blockSize = blockDim.x;
    for (int offset = blockSize >> 1; offset > 32; offset >>= 1)
    {
        if (cacheIndex < offset)
        {
            cache[cacheIndex] += cache[cacheIndex + offset];
        }
        __syncthreads();
    }
    
    // Unroll the final warp for performance
    if (cacheIndex < 32)
    {
        volatile int* vcache = cache;  // Use volatile to prevent optimizer reordering
        vcache[cacheIndex] += vcache[cacheIndex + 32];
        vcache[cacheIndex] += vcache[cacheIndex + 16];
        vcache[cacheIndex] += vcache[cacheIndex + 8];
        vcache[cacheIndex] += vcache[cacheIndex + 4];
        vcache[cacheIndex] += vcache[cacheIndex + 2];
        vcache[cacheIndex] += vcache[cacheIndex + 1];
    }

    if (cacheIndex == 0)
    {
        atomicAdd(sum, cache[0]);
    }
}