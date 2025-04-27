#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCK_SIZE 256

__global__ void degreeCalcOptimized(int *array, int array_size, int *result) {
    __shared__ int local_sum[BLOCK_SIZE];  // Shared memory for partial sums
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    local_sum[threadIdx.x] = 0;

    if (i < array_size) {
        local_sum[threadIdx.x] = array[i];
    }
    __syncthreads();

    // Reduce within block
    for (int offset = blockDim.x / 2; offset > 0; offset >>= 1) {
        if (threadIdx.x < offset) {
            local_sum[threadIdx.x] += local_sum[threadIdx.x + offset];
        }
        __syncthreads();
    }

    // Accumulate block results to global memory
    if (threadIdx.x == 0) {
        atomicAdd(result, local_sum[0]);
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