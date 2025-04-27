#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int sum = 1;

__global__ void degreeCalc(int *array) {
    // Use shared memory to reduce global memory writes
    __shared__ int localSum;
    if (threadIdx.x == 0) {
        localSum = 0;
    }
    __syncthreads();

    int i = blockDim.x * blockIdx.x + threadIdx.x;

    if (i < 1000000) {
        atomicAdd(&localSum, array[i]); // Use atomicAdd to avoid race conditions
    }
    __syncthreads();

    // Only the first thread adds to global sum to avoid contention
    if (threadIdx.x == 0) {
        atomicAdd(&sum, localSum);
    }
}

__global__ void degreeCalc(int *vertexArray, int *neighbourArray, int *degreeCount, int n, int m) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    if (i < n) {
        int start = vertexArray[i];
        int stop = (i == n - 1) ? (2 * m) : vertexArray[i + 1];
        
        // Store degree difference directly to avoid additional variables
        degreeCount[i] = stop - start;
    }
}