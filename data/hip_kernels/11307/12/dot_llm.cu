#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dot(float *a, float *b, float *c)
{
    extern __shared__ float cache[]; // Dynamically allocated shared memory
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int cacheIndex = threadIdx.x;

    float temp = 0.0f;
    int stride = blockDim.x * gridDim.x;

    // Unrolling the loop for better performance
    for (int i = tid; i < N; i += stride)
    {
        temp += a[i] * b[i];
    }
    cache[cacheIndex] = temp;

    __syncthreads();

    // Optimized reduction using warp shuffle for first 32 threads
    for (int d = warpSize / 2; d > 0; d /= 2)
    {
        if (cacheIndex < d)
        {
            cache[cacheIndex] += __shfl_down_sync(0xFFFFFFFF, cache[cacheIndex], d);
        }
    }

    if (cacheIndex < warpSize)
    {
        // Additional reduction for multiple warps
        volatile float *v_cache = cache;
        if (cacheIndex < 16) v_cache[cacheIndex] += v_cache[cacheIndex + 16];
        if (cacheIndex < 8)  v_cache[cacheIndex] += v_cache[cacheIndex + 8];
        if (cacheIndex < 4)  v_cache[cacheIndex] += v_cache[cacheIndex + 4];
        if (cacheIndex < 2)  v_cache[cacheIndex] += v_cache[cacheIndex + 2];
        if (cacheIndex < 1)  v_cache[cacheIndex] += v_cache[cacheIndex + 1];
    }

    if (cacheIndex == 0)
    {
        c[blockIdx.x] = cache[0];
    }
}