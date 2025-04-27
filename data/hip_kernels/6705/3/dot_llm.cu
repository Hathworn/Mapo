#include "hip/hip_runtime.h"
#include "includes.h"

// Use templated shared memory and optimize block synchronization
__global__ void dot(float* a, float* b, float* c) {
    extern __shared__ float cache[];
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int cacheIndex = threadIdx.x;
    
    float temp = 0.0f;

    // Efficient iteration with stride
    for (int i = tid; i < N; i += blockDim.x * gridDim.x) {
        temp += a[i] * b[i];
    }

    // Store partial sum in shared memory
    cache[cacheIndex] = temp;
    __syncthreads();

    // Reduce within block using binary tree reduction
    for (int i = blockDim.x / 2; i > 0; i >>= 1) {
        if (cacheIndex < i) {
            cache[cacheIndex] += cache[cacheIndex + i];
        }
        __syncthreads();
    }

    // Write block result to global memory
    if (cacheIndex == 0) {
        c[blockIdx.x] = cache[0];
    }
}
```
