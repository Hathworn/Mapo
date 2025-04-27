#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void parallelReduction(int *d_array, int numberOfElements, int elementsPerThread, int numberOfThreadsPerBlock, int numberOfBlocks, int *d_global)
{
    __shared__ int sharedSum[1024]; // Shared memory for intra-block reduction
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int localSum = 0;

    // Process elements in a strided manner
    for (int i = index; i < numberOfElements; i += gridDim.x * blockDim.x)
    {
        localSum += d_array[i];
    }

    sharedSum[threadIdx.x] = localSum; // Store local sum in shared memory
    __syncthreads();

    // Intra-block reduction using shared memory
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1)
    {
        if (threadIdx.x < stride)
        {
            sharedSum[threadIdx.x] += sharedSum[threadIdx.x + stride];
        }
        __syncthreads();
    }

    // Write result for each block's reduction to global memory
    if (threadIdx.x == 0)
    {
        d_global[blockIdx.x] = sharedSum[0];
    }
}