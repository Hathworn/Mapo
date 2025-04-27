#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int sum = 1;

__global__ void degreeCalc (int *array) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    if (i < 1000000) {
        atomicAdd(&sum, array[i]); // Use atomic operation for thread safety
        // Uncomment for debugging
        // if (i == 999999) {
        //     printf("%d", sum);
        // }
    }
}

__global__ void degreeCalc (int *vertexArray, int *neighbourArray, int *degreeCount, int n, int m) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    if (i < n) {
        int start = vertexArray[i];
        int stop = vertexArray[i + 1];
        int diff = stop - start;

        degreeCount[i] = diff; // Directly compute degree difference
    }
}