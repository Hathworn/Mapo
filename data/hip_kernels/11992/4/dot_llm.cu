#include "hip/hip_runtime.h"
#include "includes.h"

#define threadsPerBlock 256
#define N 1024

__global__ void dot(float *a, float *b, float *c) {
    extern __shared__ float cache[]; // Use dynamic shared memory
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int cacheIndex = threadIdx.x;

    float temp = 0;
    for (int i = tid; i < N; i += blockDim.x * gridDim.x) { // Use for-loop for better readability
        temp += a[i] * b[i];
    }

    cache[cacheIndex] = temp;
    __syncthreads();

    for (int i = blockDim.x / 2; i > 0; i /= 2) { // Simplified loop
        if (cacheIndex < i) {
            cache[cacheIndex] += cache[cacheIndex + i];
        }
        __syncthreads();
    }

    if (cacheIndex == 0) {
        c[blockIdx.x] = cache[0];
    }
}