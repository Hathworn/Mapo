#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void conflictDetection(int *vertexArray, int *neighbourArray, int *degreeCount, int n, int m, int *detectConflict) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Exit if index i is out of vertex range
    if (i >= n) return;
    
    int myColour = degreeCount[i];
    int start = vertexArray[i];
    int stop = (i == n - 1) ? m : vertexArray[i + 1];
    
    // Use shared memory to reduce global memory access latency
    __shared__ int sharedDegree[1024]; // Adjust size based on max thread number per block
    sharedDegree[threadIdx.x] = myColour;
    __syncthreads();

    for (int j = start; j < stop; j++) {
        int neighbourIndex = neighbourArray[j] - 1;
        // Compare using shared memory to reduce global memory fetches
        if (sharedDegree[threadIdx.x] == degreeCount[neighbourIndex]) {
            detectConflict[i] = 1;
            break;
        }
    }
}