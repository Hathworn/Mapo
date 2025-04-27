#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int sum = 1;

__global__ void degreeCalc(int *array) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    if (i < 1000000) {
        atomicAdd(&sum, array[i]);  // Use atomic operation to prevent data race
    }
}

__global__ void degreeCalc(int *vertexArray, int *neighbourArray, int *degreeCount, int n, int m) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    if (i < n) {
        // Use registers to store frequently used values
        int start = vertexArray[i];
        int stop = (i == n - 1) ? 2 * m : vertexArray[i + 1];
        int diff = stop - start;
        degreeCount[i] = diff;
    }
}