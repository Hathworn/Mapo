#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void degreeCalc(int *array) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Use shared memory to reduce global memory accesses
    __shared__ int sharedSum;
    
    // Initialize shared sum for each block
    if (threadIdx.x == 0) {
        sharedSum = 0;
    }
    __syncthreads();

    // Only perform addition if index is valid
    if (i < 1000000) {
        atomicAdd(&sharedSum, array[i]);
    }
    __syncthreads();

    // Use atomic operation to update global sum
    if (threadIdx.x == 0) {
        atomicAdd(&sum, sharedSum);
    }
}

__global__ void degreeCalc(int *vertexArray, int *neighbourArray, int *degreeCount, int n, int m) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    if (i < n) {
        
        // Directly assign the difference to avoid variable usage
        degreeCount[i] = vertexArray[i + 1] - vertexArray[i];
    }
}