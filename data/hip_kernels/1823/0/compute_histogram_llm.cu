#include "hip/hip_runtime.h"
#include "includes.h"

#define N 10000000

__global__ void compute_histogram(unsigned char *data, unsigned int *histogram)
{
    __shared__ unsigned int cache[256];
    int tid = threadIdx.x + threadIdx.y * blockDim.x;
    int i = blockIdx.x * blockDim.x + tid;

    // Initialize shared memory cache to zero
    if (tid < 256) {
        cache[tid] = 0;
    }
    __syncthreads();

    // Process data in a loop
    while (i < N) {
        atomicAdd(&cache[data[i]], 1);
        i += blockDim.x * gridDim.x;
    }
    __syncthreads();

    // Accumulate shared results into global histogram
    if (tid < 256) {
        atomicAdd(&histogram[tid], cache[tid]);
    }
}