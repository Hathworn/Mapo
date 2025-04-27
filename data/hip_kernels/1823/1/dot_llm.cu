#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void dot(int *a, int *b, int *c)
{
    // shared memory cache for partial sum results
    __shared__ int cache[THREADS_PER_BLOCK];

    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int result = 0;

    // unroll loop to improve performance, process two elements per iteration
    while(i < N)
    {
        result += a[i] * b[i];
        if (i + blockDim.x * gridDim.x < N)
            result += a[i + blockDim.x * gridDim.x] * b[i + blockDim.x * gridDim.x];
        i += 2 * blockDim.x * gridDim.x;
    }

    cache[threadIdx.x] = result;

    // wait for all other threads in the same block
    __syncthreads();

    // reduction step: optimized reduction using loop unrolling
    for(int offset = blockDim.x / 2; offset > 0; offset >>= 1)
    {
        if (threadIdx.x < offset)
        {
            cache[threadIdx.x] += cache[threadIdx.x + offset];
        }
        __syncthreads();
    }

    // thread 0 writes the result for this block
    if (threadIdx.x == 0)
    {
        c[blockIdx.x] = cache[0];
    }
}