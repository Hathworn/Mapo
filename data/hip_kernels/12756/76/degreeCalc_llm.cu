#include "hip/hip_runtime.h"
#include "includes.h"

#define MAX_THREADS_PER_BLOCK 1024
__device__ int sum = 1;

__global__ void degreeCalc(int *array) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Bounds check optimized to prevent unnecessary calculations
    if (i >= 1000000) return;

    // Atomic operation to prevent race conditions
    atomicAdd(&sum, array[i]);

    // Printing is removed for performance optimization
}

__global__ void degreeCalc(int *vertexArray, int *neighbourArray, int *degreeCount, int n, int m) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Bounds check optimized to prevent unnecessary calculations
    if (i >= n) return;

    // Simplified calculation with fewer variables
    degreeCount[i] = vertexArray[i + 1] - vertexArray[i];
}