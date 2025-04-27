#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void allocateNodesKernel(int size, int *adjIndexes, int *adjacency, int *partIn, int *partOut, int *aggregated)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure idx is within the valid range
    if(idx < size && aggregated[idx] == 0)
    {
        int start = adjIndexes[idx];
        int end = adjIndexes[idx + 1];

        // Use shared memory for reduced latency
        __shared__ int candidates[10];
        __shared__ int candidateCounts[10];

        // Initialize shared memory for this thread
        for(int i = threadIdx.x; i < 10; i += blockDim.x)
        {
            candidates[i] = -1;
            candidateCounts[i] = 0;
        }
        __syncthreads(); // Ensure initialization is completed

        // Traverse neighbors to find potential aggregations
        for(int i = start; i < end; i++)
        {
            int candidate = partIn[adjacency[i]];
            if(candidate != -1)
            {
                for(int j = 0; j < 10 && candidate != -1; j++)
                {
                    if(candidates[j] == -1)
                    {
                        candidates[j] = candidate;
                        candidateCounts[j] = 1;
                        break;
                    }
                    else if(candidates[j] == candidate)
                    {
                        candidateCounts[j] += 1;
                        break;
                    }
                }
            }
        }

        // Find the most frequent candidate
        int addTo = candidates[0];
        int count = candidateCounts[0];
        for(int i = 1; i < 10; i++)
        {
            if(candidateCounts[i] > count)
            {
                count = candidateCounts[i];
                addTo = candidates[i];
            }
        }
        partOut[idx] = addTo;
        if(addTo != -1)
        {
            aggregated[idx] = 1;
        }
    }
}