#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int shared_reduce(unsigned int p, volatile unsigned int* s) {
    // Use warp shuffle operations for efficiency
    p += __shfl_down_sync(0xFFFFFFFF, p, 16);
    p += __shfl_down_sync(0xFFFFFFFF, p, 8);
    p += __shfl_down_sync(0xFFFFFFFF, p, 4);
    p += __shfl_down_sync(0xFFFFFFFF, p, 2);
    p += __shfl_down_sync(0xFFFFFFFF, p, 1);
    
    s[threadIdx.x] = p;  // Store reduction result in shared memory
    return s[0];         // Result is in s[0] due to shuffle reduction
}

__global__ void reduce(unsigned int* d_out_shared, const unsigned int* d_in) {
    extern __shared__ unsigned int s[];
    int t = threadIdx.x;
    int p = d_in[t];
    unsigned int sr = shared_reduce(p, s);
    if (t == 0) {
        *d_out_shared = sr;
    }
}