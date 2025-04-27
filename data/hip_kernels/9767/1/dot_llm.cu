#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dot(float *a, float *b, float *c, int threadperblock, int max) {
    __shared__ float cache[ThreadPerBlock];

    int tid = threadIdx.x + blockDim.x * blockIdx.x;
    int cacheindex = threadIdx.x;
    float temp = 0;

    // Loop unrolling for better performance 
    for (int i = tid; i < max; i += gridDim.x * blockDim.x) {
        temp += a[i] * b[i];  // Accumulating directly inside the loop
    }

    cache[cacheindex] = temp;
    __syncthreads();

    // Use a for-loop with bitwise operation for reduction
    for (int i = blockDim.x / 2; i > 0; i >>= 1) {
        if (cacheindex < i) {
            cache[cacheindex] += cache[cacheindex + i];
        }
        __syncthreads();
    }

    // Only one thread writes the result back to global memory
    if (cacheindex == 0) {
        c[blockIdx.x] = cache[0];
    }
}