```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void countIndices(int *indices, unsigned int *histo, int size) 
{
    int id = threadIdx.x + blockIdx.x * blockDim.x;

    int min = blockIdx.x * blockDim.x;
    int max = (blockIdx.x + 1) * blockDim.x;

    extern __shared__ unsigned int tmp[];

    tmp[threadIdx.x] = 0;
    __syncthreads();

    // Load balancing by distributing work more evenly among threads
    for (int i = id; i < size; i += gridDim.x * blockDim.x) 
    {
        if (min <= indices[i] && indices[i] < max) 
        {
            atomicAdd(&tmp[indices[i] - min], 1);
        }
    }

    __syncthreads();

    // Write the result from shared memory to the global histogram
    if (threadIdx.x < blockDim.x) 
    {
        histo[id] = tmp[threadIdx.x];
    }
}