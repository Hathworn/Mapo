#include "hip/hip_runtime.h"
#include "includes.h"
__global__ static void kernelCalcSum_EffectiveShareAccess_UnrolWarp(const int* dataArray, int arraySize, int* sum)
{
__shared__ extern int cache[];

int cacheIndex = threadIdx.x;

int arrayIndex1 = (int)(blockDim.x * blockIdx.x + threadIdx.x);
int arrayIndex2 = arrayIndex1 + gridDim.x * blockDim.x;

cache[cacheIndex] = 0;

if (arrayIndex1 < arraySize)
{
cache[cacheIndex] += dataArray[arrayIndex1];
}

if (arrayIndex2 < arraySize)
{
cache[cacheIndex] += dataArray[arrayIndex2];
}

__syncthreads();

int blockSize = blockDim.x;
for (int offset = blockSize >> 1; offset > 32; offset >>= 1)
{
if (cacheIndex < offset)
{
cache[cacheIndex] += cache[cacheIndex ^ offset];
}
__syncthreads();
}

// Unroll the for loop by warp
if (threadIdx.x < 32)
{
cache[cacheIndex] += cache[cacheIndex ^ 32];
cache[cacheIndex] += cache[cacheIndex ^ 16];
cache[cacheIndex] += cache[cacheIndex ^ 8];
cache[cacheIndex] += cache[cacheIndex ^ 4];
cache[cacheIndex] += cache[cacheIndex ^ 2];
cache[cacheIndex] += cache[cacheIndex ^ 1];
}

if (cacheIndex == 0)
{
atomicAdd(sum, cache[0]);
}
}