#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpuDot(float* dot, float* a, float* b, int N)
{
    __shared__ float cache[THREADS_PER_BLOCK];
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int cacheIdx = threadIdx.x;
    
    float temp = 0;

    // Unroll the loop to reduce loop overhead
    for (int i = tid; i < N; i += blockDim.x * gridDim.x) {
        temp += a[i] * b[i];
    }

    cache[cacheIdx] = temp;

    __syncthreads();

    // Optimized reduction tree
    for(int i = blockDim.x / 2; i > 0; i >>= 1) {
        if (cacheIdx < i) {
            cache[cacheIdx] += cache[cacheIdx + i];
        }
        __syncthreads();
    }

    if (cacheIdx == 0) {
        dot[blockIdx.x] = cache[0];
    }
}