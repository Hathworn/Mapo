#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int sum = 1;

// Optimized global kernel function
__global__ void degreeCalc(int *vertexArray, int *neighbourArray, int *degreeCount, int n, int m) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Check if thread index is within bounds
    if (i >= n) return;

    // Load start and stop indices to shared memory to reduce global memory access
    __shared__ int start, stop;
    
    start = vertexArray[i];
    stop = (i == n - 1) ? m : vertexArray[i + 1];

    int diff = stop - start;
    
    // Atomic addition for degree count
    atomicAdd(&degreeCount[i], diff);

    // Loop through neighbors
    for (int j = start; j < stop; j++) {
        atomicAdd(&degreeCount[neighbourArray[j] - 1], 1);
    }
}