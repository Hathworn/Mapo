#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void dot( float *a, float *b, float *c ) {
    __shared__ float cache[threadsPerBlock];
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int cacheIndex = threadIdx.x;

    float temp = 0.0f;
    while (tid < N) {
        temp += a[tid] * b[tid];
        tid += blockDim.x * gridDim.x;
    }

    // Store the computed value in cache
    cache[cacheIndex] = temp;

    // Synchronize all threads within the block
    __syncthreads();

    // Perform reduction in shared memory
    for (int i = blockDim.x / 2; i > 0; i /= 2) {
        if (cacheIndex < i) {
            cache[cacheIndex] += cache[cacheIndex + i];
        }
        __syncthreads(); // Synchronize after each step
    }

    // Write the result of this block to the output array
    if (cacheIndex == 0) {
        c[blockIdx.x] = cache[0];
    }
}