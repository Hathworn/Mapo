#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Dot(float *a, float *b, float *c)
{
    __shared__ float cache[ThreadsPerBlock];
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int cacheIndex = threadIdx.x;
    float temp = 0.0f;

    // Loop unrolling for better performance
    int stride = blockDim.x * gridDim.x;
    while (tid < N - 3) {
        temp += a[tid] * b[tid] 
              + a[tid + 1] * b[tid + 1] 
              + a[tid + 2] * b[tid + 2] 
              + a[tid + 3] * b[tid + 3];
        tid += stride;
    }

    // Remaining elements
    for (; tid < N; tid += stride) {
        temp += a[tid] * b[tid];
    }

    cache[cacheIndex] = temp;
    __syncthreads();

    // Improved parallel reduction
    for (int i = blockDim.x / 2; i > 0; i /= 2) {
        if (cacheIndex < i) {
            cache[cacheIndex] += cache[cacheIndex + i];
        }
        __syncthreads();
    }

    if (cacheIndex == 0) {
        c[blockIdx.x] = cache[0];
    }
}