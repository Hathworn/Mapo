#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int sum = 1;

// Optimized version: parallel reduction to avoid contention
__global__ void degreeCalcOptimized(int *array, int length) {
    extern __shared__ int sharedSum[];
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int localSum = 0;

    if (i < length) {
        localSum = array[i];
    }

    sharedSum[threadIdx.x] = localSum;
    __syncthreads();

    // Perform parallel reduction
    for (int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (threadIdx.x < s) {
            sharedSum[threadIdx.x] += sharedSum[threadIdx.x + s];
        }
        __syncthreads();
    }

    if (threadIdx.x == 0) {
        atomicAdd(&sum, sharedSum[0]);
    }
}

// Improved atomic operations to minimize contention
__global__ void degreeCalc(int *vertexArray, int *neighbourArray, int *degreeCount, int n, int m) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    if (i < n) {
        int start = vertexArray[i];
        int stop = (i == n - 1) ? m : vertexArray[i + 1];
        int diff = stop - start;

        atomicAdd(&degreeCount[i], diff);

        for (int j = start; j < stop; j++) {
            atomicAdd(&degreeCount[neighbourArray[j] - 1], 1);
        }
    }
}