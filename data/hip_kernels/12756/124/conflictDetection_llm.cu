#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void conflictDetection (int *vertexArray, int *neighbourArray, int *degreeCount, int n, int m, int *detectConflict) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    if (i >= n) {
        return;
    }

    int myColour = degreeCount[i];
    int start = vertexArray[i];
    int stop = vertexArray[i + 1];

    for (int j = start; j < stop; j++) {
        int neighborIndex = neighbourArray[j] - 1;
        if (degreeCount[neighborIndex] == myColour) {
            if (i < neighborIndex) {
                // Atomic set to prevent race conditions
                atomicExch(&detectConflict[i], 1);
            } else {
                atomicExch(&detectConflict[neighborIndex], 1);
            }
        }
    }
}