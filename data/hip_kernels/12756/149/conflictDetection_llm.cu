#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void conflictDetection(int *vertexArray, int *neighbourArray, int *degreeCount, int n, int m, int *detectConflict) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    if (i >= n) {
        return;
    }

    int myColour = degreeCount[i];
    int start = vertexArray[i];
    int stop = vertexArray[i + 1];

    for (int j = start; j < stop; j++) {
        int neighborIdx = neighbourArray[j] - 1;
        
        if (degreeCount[neighborIdx] == myColour) {
            // Avoid setting the same conflict value multiple times
            if (i < neighborIdx) {
                atomicExch(&detectConflict[i], 1); // Use atomic to ensure correct setting
            } else {
                atomicExch(&detectConflict[neighborIdx], 1); // Use atomic to ensure correct setting
            }
        }
    }
}