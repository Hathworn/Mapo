#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dot(float *a, float *b, float *c) {
    __shared__ float cache[threadsPerBlock];
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int cacheIndex = threadIdx.x;

    float temp = 0.0f;
    // Process multiple elements per thread to improve performance
    for (int i = tid; i < N; i += blockDim.x * gridDim.x) {
        temp += a[i] * b[i];
    }

    // Set shared cache with the computed values
    cache[cacheIndex] = temp;
    
    // Synchronize threads within the block
    __syncthreads();

    // Perform reduction in the shared memory
    for (int i = blockDim.x / 2; i > 0; i >>= 1) {
        if (cacheIndex < i) {
            cache[cacheIndex] += cache[cacheIndex + i];
        }
        __syncthreads();
    }

    // Store the result from each block
    if (cacheIndex == 0) {
        c[blockIdx.x] = cache[0];
    }
}