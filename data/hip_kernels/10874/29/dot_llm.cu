#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dot(int size, float *a, float *b, float *c) {
    extern __shared__ float cache[]; // Use dynamic shared memory for better flexibility
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int cacheIndex = threadIdx.x;
    
    float temp = 0.0f;
    // Use unrolling for improved performance
    for (int i = tid; i < size; i += blockDim.x * gridDim.x) {
        temp += a[i] * b[i];
    }

    // Set the cache values
    cache[cacheIndex] = temp;

    // Synchronize threads in this block
    __syncthreads();

    // Perform reduction in shared memory
    for (int i = blockDim.x / 2; i > 0; i >>= 1) {
        if (cacheIndex < i) {
            cache[cacheIndex] += cache[cacheIndex + i];
        }
        __syncthreads();
    }

    // Write result for this block to global memory
    if (cacheIndex == 0) {
        c[blockIdx.x] = cache[0];
    }
}