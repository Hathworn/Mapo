#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void dot(int size, float *a, float *b, float *c) {
    __shared__ float cache[threadsPerBlock];
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int cacheIndex = threadIdx.x;

    float temp = 0;
    // Loop unrolling for better performance
    while (tid < size) {
        temp += a[tid] * b[tid];
        tid += blockDim.x * gridDim.x;
    }

    // Store temp result to shared memory
    cache[cacheIndex] = temp;

    // Synchronize threads in the block
    __syncthreads();

    // Shared memory reduction using two-way loop unrolling
    for (int i = blockDim.x / 2; i > 0; i >>= 1) {
        if (cacheIndex < i) {
            cache[cacheIndex] += cache[cacheIndex + i];
        }
        __syncthreads();
    }

    // Store the block result in the global memory
    if (cacheIndex == 0) {
        c[blockIdx.x] = cache[0];
    }
}