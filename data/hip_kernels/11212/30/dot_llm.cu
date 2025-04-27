#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dot(int size, float *a, float *b, float *c) {
    __shared__ float cache[threadsPerBlock];
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int cacheIndex = threadIdx.x;

    float temp = 0;
    // Unroll loop for better memory access and computation
    for (int i = tid; i < size; i += blockDim.x * gridDim.x) {
        temp += a[i] * b[i];
    }

    // Set cache values
    cache[cacheIndex] = temp;

    // Synchronize threads in this block
    __syncthreads();

    // Perform parallel reduction
    for (int i = blockDim.x / 2; i > 0; i >>= 1) {
        if (cacheIndex < i) {
            cache[cacheIndex] += cache[cacheIndex + i];
        }
        __syncthreads();
    }

    // Store result for this block
    if (cacheIndex == 0) {
        c[blockIdx.x] = cache[0];
    }
}