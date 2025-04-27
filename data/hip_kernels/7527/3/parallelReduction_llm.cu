#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void parallelReduction(int *d_array, int numberOfElements, int elementsPerThread, int numberOfThreadsPerBlock, int numberOfBlocks, int *d_global)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    index = index * elementsPerThread;

    if (index >= numberOfElements) // Check for valid index
    {
        return;
    }

    int sum = 0;
    for (int i = index; i < index + elementsPerThread && i < numberOfElements; i++) // Avoid out-of-bounds access
    {
        sum += d_array[i];
    }

    extern __shared__ int d_blockMemmory[];
    d_blockMemmory[threadIdx.x] = sum;
    __syncthreads();

    // Use a reduction pattern to optimize block-level summing
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1)
    {
        if (threadIdx.x < s)
        {
            d_blockMemmory[threadIdx.x] += d_blockMemmory[threadIdx.x + s];
        }
        __syncthreads();
    }

    if (threadIdx.x == 0) // Write result of each block to global memory
    {
        d_global[blockIdx.x] = d_blockMemmory[0];
    }
}