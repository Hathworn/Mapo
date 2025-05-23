#include "hip/hip_runtime.h"
#include "includes.h"

#define N 1024
#define imin(a, b) (a < b ? a : b)
const int threadsPerBlock = 256;
const int blocksPerGrid = imin(32, (N + threadsPerBlock - 1) / threadsPerBlock);

__global__ void multiplyMatrix(float *a, float *b, float *c) {
    __shared__ float cache[threadsPerBlock];

    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int cacheIndex = threadIdx.x;

    float temp = 0;
    while (tid < N) {
        temp += a[tid] * b[tid]; // Accumulate product
        tid += blockDim.x * gridDim.x;
    }

    cache[cacheIndex] = temp;

    __syncthreads();

    // Reduce within block
    for (int i = blockDim.x / 2; i > 0; i >>= 1) {
        if (cacheIndex < i) {
            cache[cacheIndex] += cache[cacheIndex + i];
        }
        __syncthreads();
    }

    if (cacheIndex == 0) {
        c[blockIdx.x] = cache[0];
    }
}