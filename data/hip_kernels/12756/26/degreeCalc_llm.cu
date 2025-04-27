#include "hip/hip_runtime.h"
#include "includes.h"
__device__ int sum = 1;

__global__ void degreeCalc(int* array) {
    // Calculate thread index
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Efficient boundary check
    if (i >= 1000000) return;

    // Atomic addition for concurrent updates
    atomicAdd(&sum, array[i]);
}

__global__ void degreeCalc(int* vertexArray, int* neighbourArray, int* degreeCount, int n, int m) {
    // Calculate thread index
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Efficient boundary check
    if (i >= n) return;

    // Calculate start and stop indices
    int start = vertexArray[i];
    int stop = (i == n-1) ? 2 * m : vertexArray[i + 1];

    // Store the degree count
    degreeCount[i] = stop - start;
}