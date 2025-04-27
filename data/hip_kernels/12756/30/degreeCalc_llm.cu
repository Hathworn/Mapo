#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int sum = 1;  

__global__ void degreeCalc(int *array) {
    // Calculate global index
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Check boundary condition
    if (i >= 1000000) {
        return;
    }

    // Use atomic operation to prevent race condition
    atomicAdd(&sum, array[i]);
}

__global__ void degreeCalc(int *vertexArray, int *neighbourArray, int *degreeCount, int n, int m) {
    // Calculate global index
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Check boundary condition
    if (i >= n) {
        return;
    }

    // Calculate start and stop indices, compute degree
    int start = vertexArray[i];
    int stop = (i == n - 1) ? 2 * m : vertexArray[i + 1];
    int diff = stop - start;

    // Save computed degree
    degreeCount[i] = diff;
}