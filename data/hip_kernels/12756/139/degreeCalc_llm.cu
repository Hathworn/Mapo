#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int sum = 1;  

__global__ void degreeCalc(int *array) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Ensure that only valid indices are processed with improved condition check
    if (i < 1000000) {
        atomicAdd(&sum, array[i]); // Use atomic operation to safely update 'sum'
    }
}

__global__ void degreeCalc(int *vertexArray, int *neighbourArray, int *degreeCount, int n, int m) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Execute thread only when 'i' is within range
    if (i < n) {
        int start = vertexArray[i];
        int stop = (i == n - 1) ? 2 * m : vertexArray[i + 1]; // Improved conditional assignment
        degreeCount[i] = stop - start; // Directly calculate degree count
    }
}