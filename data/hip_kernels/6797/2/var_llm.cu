#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel function
__global__ void var(int *a, int *b, int n, float mean) {
    // Get global thread index
    int globalIdx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    float sum = 0;

    // Parallelize operations across threads
    for (int i = globalIdx; i < n; i += stride) {
        float diff = a[i] - mean;
        sum += diff * diff;
    }

    // Use shared memory to reduce sums within block
    extern __shared__ float sharedSum[];

    sharedSum[threadIdx.x] = sum;
    __syncthreads();

    // Perform parallel reduction within the block
    for (int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (threadIdx.x < s) {
            sharedSum[threadIdx.x] += sharedSum[threadIdx.x + s];
        }
        __syncthreads();
    }

    // Write result for this block to global memory
    if (threadIdx.x == 0) {
        b[blockIdx.x] = sharedSum[0];
    }
}