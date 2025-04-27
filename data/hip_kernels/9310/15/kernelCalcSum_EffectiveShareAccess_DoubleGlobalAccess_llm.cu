#include "hip/hip_runtime.h"
#include "includes.h"
__global__ static void kernelCalcSum_EffectiveShareAccess_DoubleGlobalAccess(const int* dataArray, int arraySize, int* sum)
{
    __shared__ int cache[1024]; // Pre-allocated shared memory to avoid dynamic allocation

    int cacheIndex = threadIdx.x;
    int arrayIndex = blockDim.x * blockIdx.x * 2 + threadIdx.x; // Optimize array access for coalesced memory access

    int tempSum = 0; // Use a register for temporary storage

    if (arrayIndex < arraySize)
    {
        tempSum += dataArray[arrayIndex];
    }

    int secondIndex = arrayIndex + blockDim.x;
    if (secondIndex < arraySize)
    {
        tempSum += dataArray[secondIndex];
    }

    cache[cacheIndex] = tempSum; // Store the sum in shared memory

    __syncthreads();

    int blockSize = blockDim.x;
    for (int offset = blockSize >> 1; offset > 0; offset >>= 1)
    {
        if (cacheIndex < offset)
        {
            cache[cacheIndex] += cache[cacheIndex + offset]; // Use index + offset for better readability
        }
        __syncthreads();
    }

    if (cacheIndex == 0)
    {
        atomicAdd(sum, cache[0]); // Atomic add the result of this block to the global sum
    }
}