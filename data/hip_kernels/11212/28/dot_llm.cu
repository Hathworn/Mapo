#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void dot(int size, float *a, float *b, float *c) {
    extern __shared__ float cache[];  // Use dynamic shared memory
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int cacheIndex = threadIdx.x;

    float temp = 0.0f;
    // Loop unrolling to reduce loop overhead
    for (int i = tid; i < size; i += blockDim.x * gridDim.x) {
        temp += a[i] * b[i];
    }

    // Store temp result in cache
    cache[cacheIndex] = temp;
    __syncthreads();

    // Parallel reduction within shared memory
    for (int i = blockDim.x / 2; i > 0; i >>= 1) {
        if (cacheIndex < i) {
            cache[cacheIndex] += cache[cacheIndex + i];
        }
        __syncthreads();
    }

    // Store the final result of this block to the output array
    if (cacheIndex == 0) {
        c[blockIdx.x] = cache[0];
    }
}