#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void decrementalColouringNew(int *vertexArray, int *neighbourArray, int n, int m, int *decrementalArray, int size) {

    int i = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Early exit for threads outside array bounds
    if (i >= size) {
        return;
    }

    int me = decrementalArray[i];
    int you = decrementalArray[i ^ 1]; // Use XOR to simplify index calculation for 'you'

    int startStart = vertexArray[me - 1];
    int startStop = vertexArray[me];

    // Iterate with a while loop for potential early exit
    int j = startStart;
    while (j < startStop) {
        if (neighbourArray[j] == you) {
            neighbourArray[j] = 0; // Mark the edge as deleted
            break; // Exit once the edge is found and deleted
        }
        j++;
    }
}