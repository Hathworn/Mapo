#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int shared_reduce(unsigned int p, volatile unsigned int * s) {
    // Store predicate in shared memory
    int tid = threadIdx.x;
    s[tid] = p;
    __syncthreads();

    // Optimized reduction using warp shuffle instructions
    for (int offset = 16; offset > 0; offset /= 2) {
        p += __shfl_down_sync(0xFFFFFFFF, p, offset);
    }

    // Store result in shared memory only once
    if (tid == 0) {
        s[0] = p;
    }
    __syncthreads();
    
    return s[0]; // Return the sum from shared memory
}

__global__ void reduce(unsigned int * d_out_shared, const unsigned int * d_in) {
    extern __shared__ unsigned int s[];
    int t = threadIdx.x;
    int p = d_in[t];
    unsigned int sr = shared_reduce(p, s);
    if (t == 0) {
        *d_out_shared = sr;
    }
}