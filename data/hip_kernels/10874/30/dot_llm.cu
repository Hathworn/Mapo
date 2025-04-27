#include "hip/hip_runtime.h"
#include "includes.h"
#define threadsPerBlock 256

__global__ void dot(int size, float *a, float *b, float *c) {
    __shared__ float cache[threadsPerBlock];
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int cacheIndex = threadIdx.x;

    float temp = 0;

    // Unroll loop for performance improvement
    for (int i = tid; i < size; i += blockDim.x * gridDim.x) {
        temp += a[i] * b[i];
    }

    // Set the cache values
    cache[cacheIndex] = temp;

    // Synchronize threads in this block
    __syncthreads();

    // Use warp-synchronous reduction for better efficiency
    for (int i = blockDim.x / 2; i > 0; i /= 2) {
        if (cacheIndex < i) {
            cache[cacheIndex] += cache[cacheIndex + i];
        }
        __syncthreads();
    }

    if (cacheIndex == 0) {
        c[blockIdx.x] = cache[0];
    }
}