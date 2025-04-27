#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void conflictDetection (int *vertexArray, int *neighbourArray, int *degreeCount, int n, int m, int *detectConflict) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    if (i >= n) {
        return;
    }

    int myColour = degreeCount[i];
    int start = vertexArray[i];
    int stop = (i == n - 1) ? 2 * m : vertexArray[i + 1];

    for (int j = start; j < stop; j++) {
        int neighborIdx = neighbourArray[j] - 1;
        if (degreeCount[neighborIdx] == myColour) {
            // Use atomic operation to ensure thread safety
            if (i < neighborIdx) {
                atomicExch(&detectConflict[i], 1);
            } else {
                atomicExch(&detectConflict[neighborIdx], 1);
            }
        }
    }
}