#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int sum = 1;

// Improved: Utilize atomic operation for safe concurrent updates
__global__ void degreeCalc(int *array) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    if (i >= 1000000) {
        return;
    }

    atomicAdd(&sum, array[i]);  // Atomic addition to avoid race condition
}

__global__ void degreeCalc(int *vertexArray, int *neighbourArray, int *degreeCount, int n, int m) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    if (i >= n) {
        return;
    }

    int start = vertexArray[i];
    int stop = vertexArray[i + 1];
    int diff = stop - start;

    degreeCount[i] = diff;  // Assign difference directly
}