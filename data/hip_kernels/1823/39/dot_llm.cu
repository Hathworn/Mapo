#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dot( int size, float *a, float *b, float *c ) {
    extern __shared__ float cache[]; // Use dynamic shared memory
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int cacheIndex = threadIdx.x;
    
    float temp = 0;
    int stride = blockDim.x * gridDim.x; // Calculate stride once
    
    // Loop with improved stride access
    for (int idx = tid; idx < size; idx += stride) {
        temp += a[idx] * b[idx];
    }

    cache[cacheIndex] = temp;
    __syncthreads();

    // Unroll the reduction loop
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