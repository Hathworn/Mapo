#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void conflictDetection(int *vertexArray, int *neighbourArray, int *degreeCount, int n, int m, int *detectConflict) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Ensure thread index is within bounds
    if (i >= n) {
        return;
    }

    int myColour = degreeCount[i];
    int start = vertexArray[i];
    int stop = (i == n - 1) ? 2 * m : vertexArray[i + 1];

    // Use shared memory for conflict detection
    extern __shared__ int sharedDetectConflict[];
    if (threadIdx.x == 0) {
        sharedDetectConflict[0] = 0;
    }
    __syncthreads();

    // Iterate over all neighbors
    for (int j = start; j < stop; j++) {
        if (degreeCount[neighbourArray[j] - 1] == myColour) { // Color conflict detected
            int neighborIndex = neighbourArray[j] - 1;
            
            atomicOr(&detectConflict[i], (i < neighborIndex)); // Set conflict for current vertex
            atomicOr(&detectConflict[neighborIndex], (i >= neighborIndex)); // Set conflict for neighbor
        }
    }

    // Final synchronization for shared memory
    __syncthreads();
}