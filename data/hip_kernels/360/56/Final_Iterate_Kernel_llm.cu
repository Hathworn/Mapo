#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Final_Iterate_Kernel(int size, int *originIn, int *originOut, int *bestSeenIn, int *bestSeenOut, int *adjIndexes, int *adjacency, int *mis, int *incomplete)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= size) return; // Early exit for out-of-bound threads

    int bestSeen = bestSeenIn[idx];
    int origin = originIn[idx];

    if (bestSeen < 1000001)
    {
        int start = adjIndexes[idx];
        int end = adjIndexes[idx + 1];

        // Unroll loop for improved performance
        #pragma unroll
        for (int i = start; i < end; i++)
        {
            int neighbor = adjacency[i];
            unsigned int challenger = bestSeenIn[neighbor];
            int challengerOrigin = originIn[neighbor];

            if (challenger > bestSeen || (challenger == bestSeen && challengerOrigin > origin))
            {
                bestSeen = challenger;
                origin = challengerOrigin;
            }
        }
    }

    // Write new MIS status
    int misStatus = (origin == idx) ? 1 : ((bestSeen == 1000001) ? 0 : -1);
    mis[idx] = misStatus;

    // Atomic OR to mark incomplete if still unassigned
    if (misStatus == -1)
    {
        atomicOr(incomplete, 1);
    }
}