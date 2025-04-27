#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void degreeCalc(int *array) {
    // Efficiently calculate sum using atomic operation
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    if (i < 1000000) {
        atomicAdd(&sum, array[i]);
    }
}

__global__ void degreeCalc(int *vertexArray, int *neighbourArray, int *degreeCount, int n, int m) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    if (i < n) {
        // Use shared memory for faster access
        extern __shared__ int sharedVertexArray[];

        // Load data into shared memory for coalesced access
        sharedVertexArray[i] = vertexArray[i];

        __syncthreads();

        int start = sharedVertexArray[i];
        int stop = (i == n - 1) ? 2 * m : vertexArray[i + 1];
        
        // Store the difference directly to degreeCount
        degreeCount[i] = stop - start;
    }
}