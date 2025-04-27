#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fillCondensedAdjacencyKernel(int size, int *aggregateIdx, int *adjIndexesOut, int *adjacencyOut, int *permutedAdjIndexesIn, int *permutedAdjacencyIn)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if(idx < size)
    {
        int oldBegin = permutedAdjIndexesIn[ aggregateIdx[idx] ];
        int newBegin = adjIndexesOut[idx];
        int runSize = adjIndexesOut[idx + 1] - newBegin;

        // Use shared memory for temporary storage to optimize memory access
        extern __shared__ int sharedMem[];
        int* tempArray = sharedMem + threadIdx.x * runSize;

        // Copy adjacency over using shared memory
        for(int i = 0; i < runSize; i++)
        {
            tempArray[i] = permutedAdjacencyIn[oldBegin + i];
        }
        __syncthreads(); // Ensure all threads have completed the copy

        for(int i = 0; i < runSize; i++)
        {
            adjacencyOut[newBegin + i] = tempArray[i];
        }
    }
}