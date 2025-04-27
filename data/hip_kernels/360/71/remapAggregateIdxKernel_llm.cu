#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void remapAggregateIdxKernel(int size, int *fineAggregateSort, int *aggregateRemapId)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure idx does not exceed the allowed range
    if(idx < size)
    {
        // Perform the mapping operation
        fineAggregateSort[idx] = aggregateRemapId[fineAggregateSort[idx]];
    }
}