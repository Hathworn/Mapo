#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dot(int size, float *a, float *b, float *c) {
    __shared__ float cache[threadsPerBlock];
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int cacheIndex = threadIdx.x;

    float temp = 0;

    // Unroll the loop to reduce overhead and increase performance
    for (int i = tid; i < size; i += blockDim.x * gridDim.x) {
        temp += a[i] * b[i];
    }

    // Assign the computed value to shared memory
    cache[cacheIndex] = temp;

    // Synchronize threads in this block
    __syncthreads();

    // Reduce using binary tree reduction
    for (int i = blockDim.x / 2; i > 0; i /= 2) {
        if (cacheIndex < i) {
            cache[cacheIndex] += cache[cacheIndex + i];
        }
        __syncthreads();
    }

    // Write the computed block result to global memory
    if (cacheIndex == 0) {
        c[blockIdx.x] = cache[0];
    }
}