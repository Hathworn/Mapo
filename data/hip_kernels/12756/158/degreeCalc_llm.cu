#include "hip/hip_runtime.h"
#include "includes.h"

#define THREADS_PER_BLOCK 256

__global__ void degreeCalc(int *vertexArray, int *neighbourArray, int *degreeCount, int n) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Check within bounds for the work item
    if (i < n) {
        int start = vertexArray[i];
        int stop = vertexArray[i + 1];
        degreeCount[i] = stop - start;  // Calculate degree
    }
}