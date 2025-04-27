#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void parallelReduction(int *d_array, int numberOfElements, int elementsPerThread, int numberOfThreadsPerBlock, int numberOfBlocks, int *d_global)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int sum = 0;

    // Compute local sum
    for (int i = index; i < numberOfElements; i += numberOfBlocks * numberOfThreadsPerBlock)
    {
        sum += d_array[i];
    }

    // Use shared memory for block-level reduction
    extern __shared__ int d_blockMemmory[];
    d_blockMemmory[threadIdx.x] = sum;
    __syncthreads();

    // Perform binary reduction to minimize serial summation
    for (unsigned int stride = numberOfThreadsPerBlock / 2; stride > 0; stride >>= 1)
    {
        if (threadIdx.x < stride)
        {
            d_blockMemmory[threadIdx.x] += d_blockMemmory[threadIdx.x + stride];
        }
        __syncthreads();
    }

    // Store the result in global memory
    if (threadIdx.x == 0)
    {
        d_global[blockIdx.x] = d_blockMemmory[0];
    }
}