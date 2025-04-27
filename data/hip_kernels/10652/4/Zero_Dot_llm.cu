#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Zero_Dot(float *a, float *b, float *c)
{
    __shared__ float cache[ThreadsPerBlock];
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int cacheIndex = threadIdx.x;
    float temp = 0;

    // Optimize data parallelism by unrolling the loop
    const int gridSize = blockDim.x * gridDim.x;
    while (tid < N) {
        temp += a[tid] * b[tid];
        if (tid + gridSize < N) temp += a[tid + gridSize] * b[tid + gridSize];
        tid += gridSize * 2; // Increment by twice the gridSize
    }
    
    cache[cacheIndex] = temp;
    __syncthreads();

    // Optimizing reduction using loop unrolling technique
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