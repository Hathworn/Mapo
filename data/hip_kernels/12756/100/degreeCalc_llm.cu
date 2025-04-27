#include "hip/hip_runtime.h"
#include "includes.h"

#define THREAD_PER_BLOCK 256

// Optimized global kernel function
__global__ void degreeCalc(int *vertexArray, int *degreeCount, int n) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    if (i < n) {
        // Calculate degree count directly
        degreeCount[i] = vertexArray[i + 1] - vertexArray[i];
    }
}

// Original global kernel for sum computation
__device__ int sum = 1;
__global__ void computeSum(int *array) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    if (i < 1000000) {
        atomicAdd(&sum, array[i]); // Use atomic to prevent race conditions
    }
}