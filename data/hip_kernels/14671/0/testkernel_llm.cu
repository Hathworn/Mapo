#include "hip/hip_runtime.h"
#include "includes.h"

#ifdef is_CUDA
#endif

__global__ void testkernel()
{
    double p = threadIdx.x + 66;
    // Optimization: Use shared memory to cache sqrt values to reduce redundant calculation
    __shared__ double sqrt_cache[256]; // Assume max 256 threads per block
    sqrt_cache[threadIdx.x] = std::sqrt(p);

    // Unroll loop to reduce overhead
    for (int i = 0; i < 30000000; i += 5)
    {
        p += i / p - sqrt_cache[threadIdx.x];
        p += (i + 1) / p - sqrt_cache[threadIdx.x];
        p += (i + 2) / p - sqrt_cache[threadIdx.x];
        p += (i + 3) / p - sqrt_cache[threadIdx.x];
        p += (i + 4) / p - sqrt_cache[threadIdx.x];
    }

    // Reduced printf frequency to minimize performance impact
    if(threadIdx.x == 0 && blockIdx.x == 0)
    {
        printf("thread %d; block %d\n", threadIdx.x, blockIdx.x);
    }
}