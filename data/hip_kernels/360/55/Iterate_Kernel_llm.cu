#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Iterate_Kernel(int size, int *originIn, int *originOut, int *bestSeenIn, int *bestSeenOut, int *adjIndexes, int *adjacency)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (idx >= size) return;  // Use a guard clause for better readability and efficiency

    int bestSeen = bestSeenIn[idx];
    int origin = originIn[idx];
    
    if (bestSeen >= 1000001) {
        bestSeenOut[idx] = bestSeen;  // Directly assign unchanged values where applicable.
        originOut[idx] = origin;
        return;
    }

    int start = adjIndexes[idx];
    int end = adjIndexes[idx + 1];

    // Optimized loop to minimize redundant conditional checks
    for (int i = start; i < end; i++)
    {
        int neighbor = adjacency[i];
        int challenger = bestSeenIn[neighbor];
        int challengerOrigin = originIn[neighbor];

        // Use logical operators to reduce branching
        if ((challenger > bestSeen) || (challenger == bestSeen && challengerOrigin > origin))
        {
            bestSeen = challenger;
            origin = challengerOrigin;
        }
    }

    // Write out the best values found
    bestSeenOut[idx] = bestSeen;
    originOut[idx] = origin;
}