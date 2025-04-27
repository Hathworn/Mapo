#include "hip/hip_runtime.h"
#include "includes.h"
__global__ static void kernelFindMax2(const int* dataArray, int arraySize, int* maxVal)
{
    __shared__ int cache[1024];  // Optimize shared memory allocation size

    int cacheIndex = threadIdx.x;
    int arrayIndex = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Load elements into cache with bounds checking
    int temp = (arrayIndex < arraySize) ? dataArray[arrayIndex] : INT_MIN;
    cache[cacheIndex] = temp;
    __syncthreads();

    for (int offset = blockDim.x / 2; offset > 0; offset >>= 1) 
    {
        if (cacheIndex < offset) 
        {
            cache[cacheIndex] = max(cache[cacheIndex], cache[cacheIndex + offset]);
        }
        __syncthreads();
    }

    // Only one thread updates the global maximum
    if (cacheIndex == 0)
    {
        atomicMax(maxVal, cache[0]);
    }
}