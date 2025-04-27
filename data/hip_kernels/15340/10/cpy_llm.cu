#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cpy(int *a, int *b, int n) {
    // Calculate global thread index
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Declare shared memory for partial sums
    __shared__ int sharedSum[256];

    // Each thread calculates its sum
    int localSum = 0;
    while (i < n) {
        localSum += b[i];
        i += blockDim.x * gridDim.x;
    }

    // Store local sum in shared memory
    sharedSum[threadIdx.x] = localSum;

    // Synchronize threads in the block
    __syncthreads();

    // Reduce partial sums within this block
    for (int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (threadIdx.x < s) {
            sharedSum[threadIdx.x] += sharedSum[threadIdx.x + s];
        }
        __syncthreads();
    }

    // Add block's result to global sum using atomicAdd
    if (threadIdx.x == 0) {
        atomicAdd(a, sharedSum[0]);
    }
}