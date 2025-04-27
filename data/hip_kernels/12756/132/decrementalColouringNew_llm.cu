#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void decrementalColouringNew(int *vertexArray, int *neighbourArray, int n, int m, int *decrementalArray, int size) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Early termination for threads exceeding bounds
    if (i >= size) return;

    int startStart, startStop;
    int me, you;

    me = decrementalArray[i];
    you = (i % 2 == 0) ? decrementalArray[i + 1] : decrementalArray[i - 1];

    printf("I am %d and I am deleting %d - %d\n", i, me, you);

    // Determine start and stop based on vertex
    startStart = vertexArray[me - 1];
    startStop = (me == n) ? 2 * m : vertexArray[me];

    // Optimize loop to exit once you is found
    for (int j = startStart; j < startStop; ++j) {
        if (neighbourArray[j] == you) {
            neighbourArray[j] = 0;
            break;
        }
    }
}