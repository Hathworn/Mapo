#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int shared_reduce(unsigned int p, volatile unsigned int * s) {
    // Load input value into shared memory
    int lane = threadIdx.x % warpSize;
    s[lane] = p;

    // Perform warp-level reduction using shfl operations
    for (int offset = 1; offset < warpSize; offset *= 2) {
        unsigned int val = __shfl_down_sync(0xFFFFFFFF, s[lane], offset);
        s[lane] += val;
    }

    // Return the reduced result from the first lane
    return s[0];
}

__global__ void reduce(unsigned int * d_out_shared, const unsigned int * d_in)
{
    extern __shared__ unsigned int s[];
    int t = threadIdx.x;
    int p = d_in[t];
    unsigned int sr = shared_reduce(p, s);
    if (t == 0)
    {
        *d_out_shared = sr;
    }
}