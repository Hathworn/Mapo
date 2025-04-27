#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dot(float *a, float *b, float *c) {
    __shared__ float cache[threadsPerBlock];
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int cacheIndex = threadIdx.x;

    float temp = 0;
    int stride = blockDim.x * gridDim.x;
    // Perform loop unrolling for better performance
    while (tid < N) {
        temp += a[tid] * b[tid];
        if (tid + stride < N) temp += a[tid + stride] * b[tid + stride];
        tid += 2 * stride; // double the stride for loop unrolling
    }

    cache[cacheIndex] = temp;
    __syncthreads();

    // Perform reduction using a more efficient pattern
    for (int offset = blockDim.x / 2; offset > 0; offset >>= 1) {
        if (cacheIndex < offset) {
            cache[cacheIndex] += cache[cacheIndex + offset];
        }
        __syncthreads();
    }

    if (cacheIndex == 0)
        c[blockIdx.x] = cache[0];
}