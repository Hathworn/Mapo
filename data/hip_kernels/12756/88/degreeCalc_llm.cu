#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int sum = 1;

__global__ void degreeCalc(int *array) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    // Return early for out-of-bounds indices
    if (i >= 1000000) {
        return;
    }
    // Use atomic addition to prevent race conditions
    atomicAdd(&sum, array[i]);
}

__global__ void degreeCalc(int *vertexArray, int *neighbourArray, int *degreeCount, int n, int m) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    // Return early for out-of-bounds indices
    if (i >= n) {
        return;
    }
    // Calculate degree using start and stop indices
    int start = vertexArray[i];
    int stop = vertexArray[i + 1];
    degreeCount[i] = stop - start;
}