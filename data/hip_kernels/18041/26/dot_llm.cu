#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void dot( int size, float *a, float *b, float *c ) {
    __shared__ float cache[threadsPerBlock];
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int cacheIndex = threadIdx.x;

    // Initialize shared memory to zero
    cache[cacheIndex] = 0.0f;

    // Loop over elements and accumulate product directly in shared memory
    for (int i = tid; i < size; i += blockDim.x * gridDim.x) {
        cache[cacheIndex] += a[i] * b[i];
    }

    // Synchronize threads in this block
    __syncthreads();

    // Reduction using shared memory
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