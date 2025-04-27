#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void norm1_strided_float(int n, int xOffset, float *dx, int incx, float result) {
    // Use shared memory to reduce global memory accesses
    __shared__ float sharedSum[256]; 
    int tid = threadIdx.x; 
    sharedSum[tid] = 0.0f;

    // Use strided loop for better parallelism
    for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < n; i += blockDim.x * gridDim.x) {
        if (i >= xOffset && i % incx == 0) {
            sharedSum[tid] += abs(dx[i]);
        }
    }

    // Synchronize threads in the block
    __syncthreads();

    // Reduce within block
    for (int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            sharedSum[tid] += sharedSum[tid + s];
        }
        __syncthreads();
    }

    // Add the block result to the total result
    if (tid == 0) {
        atomicAdd(&result, sharedSum[0]);
    }
}