#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Iterate(int size, int *originIn, int *originOut, int *bestSeenIn, int *bestSeenOut, int *adjIndexes, int *adjacency) {
    // Calculate global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the index is within bounds
    if (idx < size) {
        // Cache values to reduce repeated global memory access
        int bestSeen = bestSeenIn[idx];
        int origin = originIn[idx];

        // Proceed only if bestSeen value is less than the threshold
        if (bestSeen < 1000001) {
            // Fetch starting and ending adjacency indices for the current node
            int start = adjIndexes[idx];
            int end = adjIndexes[idx + 1];

            // Use shared variables to minimize access to global memory and reduce latency
            for (int i = start; i < end; i++) {
                int neighbor = adjacency[i];
                int challenger = bestSeenIn[neighbor];
                int challengerOrigin = originIn[neighbor];

                // Update origin if challenger has the same bestSeen value but higher origin
                if (challenger > 0 && challenger == bestSeen && challengerOrigin > origin) {
                    origin = challengerOrigin;
                }

                // Update bestSeen and origin if a better challenger is found
                if (challenger > bestSeen) {
                    bestSeen = challenger;
                    origin = challengerOrigin;
                }
            }
        }

        // Write updated values back to global memory
        bestSeenOut[idx] = bestSeen;
        originOut[idx] = origin;
    }
}