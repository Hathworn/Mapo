#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void decrementalColouringNew(int *vertexArray, int *neighbourArray, int n, int m, int *decrementalArray, int size) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Early exit for out of bounds threads
    if (i >= size) {
        return;
    }
    
    int me = decrementalArray[i];
    int you = (i % 2 == 0) ? decrementalArray[i + 1] : decrementalArray[i - 1];
    
    // Calculate start and stop indices
    int startStart = vertexArray[me - 1];
    int startStop = vertexArray[me];
    
    // Replace nested loop with efficient search
    for (int j = startStart; j < startStop; j++) {
        if (neighbourArray[j] == you) {
            neighbourArray[j] = 0; // Mark as deleted
            break;
        }
    }
}