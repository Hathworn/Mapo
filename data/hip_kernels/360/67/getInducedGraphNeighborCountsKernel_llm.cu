#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void getInducedGraphNeighborCountsKernel(int size, int *aggregateIdx, int *adjIndexesOut, int *permutedAdjIndexes, int *permutedAdjacencyIn)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if(idx < size)
    {
        int Begin = permutedAdjIndexes[aggregateIdx[idx]];
        int End = permutedAdjIndexes[aggregateIdx[idx + 1]];

        // Use shared memory for temporary sorting space
        extern __shared__ int sharedMem[];
        int* tempArray = &sharedMem[threadIdx.x * (End - Begin)];
        for(int i = Begin; i < End; i++)
        {
            tempArray[i - Begin] = permutedAdjacencyIn[i];
        }
        // Apply better sorting algorithm
        for (int i = 0; i < End - Begin - 1; ++i) {
            int minIdx = i;
            for (int j = i + 1; j < End - Begin; ++j) {
                if (tempArray[j] < tempArray[minIdx]) {
                    minIdx = j;
                }
            }
            if (minIdx != i) {
                int temp = tempArray[i];
                tempArray[i] = tempArray[minIdx];
                tempArray[minIdx] = temp;
            }
        }

        // Scan through the sorted adjacency to get the condensed adjacency
        int neighborCount = 0;
        for(int i = 0; i < End - Begin; i++)
        {
            if(tempArray[i] != idx && (i == 0 || tempArray[i] != tempArray[i - 1]))
            {
                permutedAdjacencyIn[neighborCount + Begin] = tempArray[i];
                neighborCount++;
            }
        }

        // Store the size
        adjIndexesOut[idx] = neighborCount;
    }
}
```
