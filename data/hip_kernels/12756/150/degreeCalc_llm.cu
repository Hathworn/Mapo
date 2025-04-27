#include "hip/hip_runtime.h"
#include "includes.h"
__device__ int sum = 1;

__global__ void degreeCalc (int *array) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    if (i >= 1000000) {
        return;
    }

    // Atomic addition to prevent race conditions
    atomicAdd(&sum, array[i]);

    // Uncomment if printing is required
    // if (i == 999999) {
    //     printf("%d", sum);
    // }
}

__global__ void degreeCalc (int *vertexArray, int *neighbourArray, int *degreeCount, int n, int m) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    if (i >= n) {
        return;
    }

    // Directly calculate and assign the degree
    degreeCount[i] = vertexArray[i + 1] - vertexArray[i];
}