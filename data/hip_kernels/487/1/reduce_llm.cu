#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int shared_reduce(unsigned int p, volatile unsigned int * s) {
    // Perform warp-level reduction using shfl_down to minimize operations
    unsigned int lane = threadIdx.x % warpSize;
    s[lane] = p;
    for (int offset = 1; offset < warpSize; offset *= 2) {
        unsigned int val = __shfl_down(p, offset);
        p += val;
    }
    return p;
}

__global__ void reduce(unsigned int * d_out_shared, const unsigned int * d_in) {
    extern __shared__ unsigned int s[];
    int t = threadIdx.x;
    int p = d_in[t];
    unsigned int sr = shared_reduce(p, s);
    
    // Store the final reduction result in d_out_shared
    if (t % warpSize == 0) {
        atomicAdd(d_out_shared, sr);
    }
}