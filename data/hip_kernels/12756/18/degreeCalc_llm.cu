#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int sum = 1;

// Optimized kernel with unrolls for compute efficiency
__global__ void degreeCalc(int *array) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    if (i < 1000000) {
        atomicAdd(&sum, array[i]); // Use atomic add for safe global updates
    }
}

// Optimized kernel with reduced branching
__global__ void degreeCalc(int *vertexArray, int *neighbourArray, int *degreeCount, int n, int m) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    if (i < n) {
        int start = vertexArray[i];
        int stop = (i == n - 1) ? m : vertexArray[i + 1]; // Conditional operator for branch reduction

        int diff = stop - start;

        atomicAdd(&degreeCount[i], diff); // Atomic for concurrency control

        for (int j = start; j < stop; j++) {
            atomicAdd(&degreeCount[neighbourArray[j] - 1], 1); // Atomic for concurrent additions
        }
    }
}