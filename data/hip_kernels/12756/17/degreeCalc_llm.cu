#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int sum = 1;

__global__ void degreeCalc(int *array) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Use a shared variable for partial sums
    __shared__ int local_sum;

    if (threadIdx.x == 0) local_sum = 0;
    __syncthreads();

    if (i < 1000000) {
        atomicAdd(&local_sum, array[i]); // Atomic addition to avoid race condition
    }

    __syncthreads();

    if (threadIdx.x == 0) atomicAdd(&sum, local_sum); // Combine partial sums
}

// Optimize by reducing redundant operations and using grid-stride loop
__global__ void degreeCalc(int *vertexArray, int *neighbourArray, int *degreeCount, int n, int m) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    for (int idx = i; idx < n; idx += blockDim.x * gridDim.x) {
        int start = vertexArray[idx];
        int stop = (idx == n - 1) ? 2 * m : vertexArray[idx + 1];
        degreeCount[idx] = stop - start;
    }
}