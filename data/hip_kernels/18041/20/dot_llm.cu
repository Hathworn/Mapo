#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dot(float *a, float *b, float *c) {
    extern __shared__ float cache[]; // Use dynamic shared memory

    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int cacheIndex = threadIdx.x;
    float temp = 0;

    // Each thread computes partial dot product
    for (int i = tid; i < N; i += blockDim.x * gridDim.x) {
        temp += a[i] * b[i];
    }

    // Store result in cache
    cache[cacheIndex] = temp;
    __syncthreads();

    // Parallel reduction in shared memory
    for (int i = blockDim.x / 2; i > 0; i /= 2) {
        if (cacheIndex < i) {
            cache[cacheIndex] += cache[cacheIndex + i];
        }
        __syncthreads();
    }

    // Write result for block to global memory
    if (cacheIndex == 0) {
        c[blockIdx.x] = cache[0];
    }
}