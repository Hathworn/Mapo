#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dot(int size, float *a, float *b, float *c) {
    extern __shared__ float cache[]; // Use extern shared memory for flexibility
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int cacheIndex = threadIdx.x;

    float temp = 0.0f;
    // Unroll the loop for better performance
    for (int i = tid; i < size; i += blockDim.x * gridDim.x) {
        temp += a[i] * b[i];
    }

    cache[cacheIndex] = temp;
    __syncthreads();

    // Optimize reduction using loop unrolling
    for (int i = blockDim.x / 2; i > 0; i >>= 1) {
        if (cacheIndex < i) {
            cache[cacheIndex] += cache[cacheIndex + i];
        }
        __syncthreads();
    }

    if (cacheIndex == 0) {
        c[blockIdx.x] = cache[0];
    }
}