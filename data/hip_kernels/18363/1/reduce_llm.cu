#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int shared_reduce(unsigned int p, volatile unsigned int * s) {
    // Utilize warp shuffle for reduction
    p += __shfl_down_sync(0xFFFFFFFF, p, 16);
    p += __shfl_down_sync(0xFFFFFFFF, p, 8);
    p += __shfl_down_sync(0xFFFFFFFF, p, 4);
    p += __shfl_down_sync(0xFFFFFFFF, p, 2);
    p += __shfl_down_sync(0xFFFFFFFF, p, 1);
    
    if (threadIdx.x % 32 == 0) s[threadIdx.x / 32] = p;  // Store warp results to shared memory
    __syncthreads();

    // Reduce warp results stored in shared memory
    if (threadIdx.x < warpSize) {
        unsigned int val = (threadIdx.x < (blockDim.x / warpSize)) ? s[threadIdx.x] : 0;
        if (threadIdx.x < 16) {
            val += __shfl_down_sync(0xFFFFFFFF, val, 8);
            val += __shfl_down_sync(0xFFFFFFFF, val, 4);
            val += __shfl_down_sync(0xFFFFFFFF, val, 2);
            val += __shfl_down_sync(0xFFFFFFFF, val, 1);
        }
        if (threadIdx.x == 0) s[0] = val;  // Final result to s[0]
    }
    __syncthreads();

    return s[0];
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