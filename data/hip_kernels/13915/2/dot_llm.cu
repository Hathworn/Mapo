#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void dot(float *a, float *b, float *c)
{
    // Declare cache for intermediate results
    __shared__ float cache[threadsPerBlock];
    int cacheIndex = threadIdx.x;

    // Calculate global thread ID
    int tid = threadIdx.x + blockIdx.x * blockDim.x;

    // Initialize temporary sum
    float temp = 0.0;

    // Unroll loop for better performance
    while (tid < N) {
        temp += a[tid] * b[tid];
        tid += blockDim.x * gridDim.x;
    }

    // Store sum in cache
    cache[cacheIndex] = temp;
    __syncthreads();

    // Perform block-level reduction using a simpler binary reduction algorithm
    for (int i = blockDim.x/2; i > 0; i /= 2) {
        if (cacheIndex < i) {
            cache[cacheIndex] += cache[cacheIndex + i];
        }
        __syncthreads();
    }

    // Write final block result to global output array
    if (threadIdx.x == 0) {
        c[blockIdx.x] = cache[0];
    }
}