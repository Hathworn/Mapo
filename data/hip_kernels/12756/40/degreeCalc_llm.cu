#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int sum = 1;  

__global__ void degreeCalc(int *array) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    
    if (i < 1000000) {
        atomicAdd(&sum, array[i]);  // Use atomicAdd for thread-safe summation
    }
    // Uncomment for debugging output if needed
    // if (i == 999999) {
    //     printf("%d", sum);
    // }
}

__global__ void degreeCalc(int *vertexArray, int *neighbourArray, int *degreeCount, int n, int m) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    
    if (i < n) {
        int start = vertexArray[i];
        int stop;
        
        if (i == n - 1) {
            stop = 2 * m;
        } else {
            stop = vertexArray[i + 1];
        }
        
        degreeCount[i] = stop - start;  // Calculate degree directly
    }
}