#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void permuteInitialAdjacencyKernel(int size, int *adjIndexesIn, int *adjacencyIn, int *permutedAdjIndexesIn, int *permutedAdjacencyIn, int *ipermutation, int *fineAggregate)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    if(idx < size)
    {
        // Load indices once to reduce global memory accesses
        int permutedIdx = ipermutation[idx];
        int oldBegin = adjIndexesIn[permutedIdx];
        int oldEnd = adjIndexesIn[permutedIdx + 1];
        int newBegin = permutedAdjIndexesIn[idx];
        
        // Use a shared variable to minimize recalculation
        int runSize = oldEnd - oldBegin;

        // Copy and transform adjacency in a single loop without unnecessary load/store
        for(int i = 0; i < runSize; i++)
        {
            int adjIdx = adjacencyIn[oldBegin + i];
            permutedAdjacencyIn[newBegin + i] = fineAggregate[adjIdx];
        }
    }
}