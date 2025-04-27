```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void degreeCalc(int *array) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    if (i >= 1000000) {
        return;
    }

    // Use shared memory for reduction
    __shared__ int localSum[256];  // Example: 256 threads per block, adjust if needed
    localSum[threadIdx.x] = array[i];
    __syncthreads();

    // Parallel reduction within the block
    for (int offset = blockDim.x / 2; offset > 0; offset >>= 1) {
        if (threadIdx.x < offset) {
            localSum[threadIdx.x] += localSum[threadIdx.x + offset];
        }
        __syncthreads();
    }

    // Add the block's result to global sum
    if (threadIdx.x == 0) {
        atomicAdd(&sum, localSum[0]);
    }
}

__global__ void degreeCalc(int *vertexArray, int *neighbourArray, int *degreeCount, int n, int m) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    if (i >= n) {
        return;
    }

    int start = vertexArray[i];
    int stop = (i == n - 1) ? 2 * m : vertexArray[i + 1];
    degreeCount[i] = stop - start;
}