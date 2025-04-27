#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void degreeCalc(int *array) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    if (i >= 1000000) {
        return;
    }
    atomicAdd(&sum, array[i]); // Optimize sum operation with atomicAdd
}

__global__ void degreeCalc(int *vertexArray, int *neighbourArray, int *degreeCount, int n, int m) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    if (i >= n) {
        return;
    }
    
    int start = vertexArray[i];
    int stop = (i == n - 1) ? 2 * m : vertexArray[i + 1]; // Simplified conditional expression
    degreeCount[i] = stop - start;
}