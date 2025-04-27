#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int sum = 1;

__global__ void degreeCalc (int *array) {
    // Calculate the global thread index
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Bounds check to ensure index falls within valid range
    if (i >= 1000000) {
        return;
    }

    // Use atomic operation to prevent race conditions
    atomicAdd(&sum, array[i]);
}

__global__ void degreeCalc (int *vertexArray, int *neighbourArray, int *degreeCount, int n, int m) {
    // Calculate the global thread index
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Bounds check to ensure index falls within valid range
    if (i >= n) {
        return;
    }

    // Efficiently compute the degree by directly calculating the difference
    int start = vertexArray[i];
    int stop = vertexArray[i + 1];
    degreeCount[i] = stop - start;
}