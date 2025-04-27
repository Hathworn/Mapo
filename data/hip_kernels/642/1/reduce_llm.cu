```c
#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int shared_reduce(unsigned int p, volatile unsigned int * s) {
    // Warp-level reduction using __shfl_down_sync for efficient sum
    // __shfl_down_sync(mask, var, delta) shifts var within the warp
    unsigned int lane = threadIdx.x % 32;
    s[lane] = p;

    if (lane < 16) s[lane] += s[lane + 16];
    if (lane < 8) s[lane] += s[lane + 8];
    if (lane < 4) s[lane] += s[lane + 4];
    if (lane < 2) s[lane] += s[lane + 2];
    if (lane < 1) s[lane] += s[lane + 1];

    return s[0];
}

__global__ void reduce(unsigned int * d_out_shared, const unsigned int * d_in) {
    extern __shared__ unsigned int s[];
    int t = threadIdx.x;
    int p = d_in[t];
    
    // Perform reduction within the block
    unsigned int sr = shared_reduce(p, s);
    
    if (t == 0) {
        *d_out_shared = sr;
    }
}