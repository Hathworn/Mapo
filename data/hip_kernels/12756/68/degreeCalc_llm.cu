#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int sum = 1;

__global__ void degreeCalc (int *array) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Use shared memory for better memory access
    __shared__ int localSum;
    if (threadIdx.x == 0) localSum = 0;
    __syncthreads();

    if (i < 1000000) {
        atomicAdd(&localSum, array[i]);
    }
    __syncthreads();

    // Reduce local sums and update global sum
    if (threadIdx.x == 0) atomicAdd(&sum, localSum);
}

__global__ void degreeCalc (int *vertexArray, int *neighbourArray, int *degreeCount, int n, int m){
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    if (i < n) {
        // Directly calculate degree count without redundant variables
        degreeCount[i] = vertexArray[i + 1] - vertexArray[i];
    }
}