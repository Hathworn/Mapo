#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void decrementalColouringNew(int *vertexArray, int *neighbourArray, int n, int m, int *decrementalArray, int size) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Exit if the thread index exceeds the size
    if (i >= size) {
        return;
    }

    int startStart, startStop;
    int me, you;

    // Determine the vertices 'me' and its paired 'you'
    me = decrementalArray[i];
    you = (i % 2 == 0) ? decrementalArray[i + 1] : decrementalArray[i - 1];

    // Calculate the start and stop index for the vertex's neighbors
    startStart = vertexArray[me - 1];
    startStop = vertexArray[me];

    // Use a single loop to find and zero out the neighbor
    for (int j = startStart; j < startStop; j++) {
        if (neighbourArray[j] == you) {
            neighbourArray[j] = 0;
            break; // Exit once the match is found and processed
        }
    }
}