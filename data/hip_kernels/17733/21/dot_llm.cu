```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dot(float *a, float *b, float *c) {
    __shared__ float cache[threadsPerBlock];
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int cacheIndex = threadIdx.x;

    float temp = 0.0f;
    // Unroll loops for efficiency
    for (int i = tid; i < N; i += blockDim.x * gridDim.x) {
        temp += a[i] * b[i];
    }

    // Save in shared memory
    cache[cacheIndex] = temp;

    // Synchronize threads in this block
    __syncthreads();

    // Perform reduction using shared memory
    for (int i = blockDim.x / 2; i > 0; i /= 2) {
        if (cacheIndex < i) {
            cache[cacheIndex] += cache[cacheIndex + i];
        }
        __syncthreads();
    }

    // Store block result
    if (cacheIndex == 0) {
        c[blockIdx.x] = cache[0];
    }
}