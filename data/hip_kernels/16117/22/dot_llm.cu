#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dot(float *a, float *b, float *c) {
    // Use dynamic shared memory allocation
    extern __shared__ float cache[];
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int cacheIndex = threadIdx.x;

    float temp = 0.0f;
    // Unroll the loop for better performance
    for (int i = tid; i < N; i += blockDim.x * gridDim.x) {
        temp += a[i] * b[i];
    }

    // Cache the partial sum
    cache[cacheIndex] = temp;

    // Synchronize threads in this block
    __syncthreads();

    // Reduce within shared memory
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (cacheIndex < stride) {
            // Use atomic addition for better performance
            cache[cacheIndex] += cache[cacheIndex + stride];
        }
        __syncthreads();
    }

    // Write result for this block to global memory
    if (cacheIndex == 0) {
        c[blockIdx.x] = cache[0];
    }
}