#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int sum = 1;

__global__ void degreeCalc(int *array) {
    // Utilize shared memory for reduced global memory access
    __shared__ int sharedSum;
    if (threadIdx.x == 0) sharedSum = 0;
    __syncthreads();

    int i = blockDim.x * blockIdx.x + threadIdx.x;
    if (i < 1000000) {
        atomicAdd(&sharedSum, array[i]);
    }
    __syncthreads();

    // Update global sum from shared sum
    if (threadIdx.x == 0) atomicAdd(&sum, sharedSum);
}

__global__ void degreeCalc(int *vertexArray, int *neighbourArray, int *degreeCount, int n, int m) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    if (i < n) {
        int start = vertexArray[i];
        int stop = (i == n - 1) ? 2 * m : vertexArray[i + 1];
        int diff = stop - start;
        degreeCount[i] = diff;
    }
}